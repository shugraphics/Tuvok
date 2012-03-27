/*
 For more information, please see: http://software.sci.utah.edu

 The MIT License

 Copyright (c) 2012 Scientific Computing and Imaging Institute,
 University of Utah.


 Permission is hereby granted, free of charge, to any person obtaining a
 copy of this software and associated documentation files (the "Software"),
 to deal in the Software without restriction, including without limitation
 the rights to use, copy, modify, merge, publish, distribute, sublicense,
 and/or sell copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included
 in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 DEALINGS IN THE SOFTWARE.
 */

/**
 \file    LUAScripting.h
 \author  James Hughes
          SCI Institute
          University of Utah
 \date    Mar 21, 2012
 \brief   Interface to the LUA scripting system built for Tuvok.
          Made to be unit tested externally.
 */

#ifndef LUASCRIPTING_H_
#define LUASCRIPTING_H_

namespace tuvok
{

//===============================
// LUA BINDING HELPER STRUCTURES
//===============================

// These structures were created in order to handle void return types *easily*
// and without code duplication.

/// TODO: Store LUAScripting class as an upvalue.

template <typename FunPtr, typename Ret>
struct LUACallback
{
  static int exec(lua_State* L)
  {
    FunPtr fp = (FunPtr)lua_touserdata(L, lua_upvalueindex(1));
    Ret r = LUACFunExec<FunPtr>::run(fp, L);
    LUAStrictStack<Ret>().push(L, r);
    return 1;
  }
};

// Without a return value.
template <typename FunPtr>
struct LUACallback <FunPtr, void>
{
  static int exec(lua_State* L)
  {
    FunPtr fp = (FunPtr)lua_touserdata(L, lua_upvalueindex(1));
    LUACFunExec<FunPtr>::run(fp, L);
    return 0;
  }
};

template <typename FunPtr, typename Ret>
struct LUAMemberCallback
{
  static int exec(lua_State* L)
  {
    FunPtr fp = *(FunPtr*)lua_touserdata(L, lua_upvalueindex(1));
    typename LUACFunExec<FunPtr>::classType* C =
        static_cast<typename LUACFunExec<FunPtr>::classType*>(
            lua_touserdata(L, lua_upvalueindex(2)));
    Ret r = LUACFunExec<FunPtr>::run(C, fp, L);
    LUAStrictStack<Ret>().push(L, r);
    return 1;
  }
};

// Without a return value.
template <typename FunPtr>
struct LUAMemberCallback <FunPtr, void>
{
  static int exec(lua_State* L)
  {
    FunPtr fp = (FunPtr)lua_touserdata(L, lua_upvalueindex(1));
    typename LUACFunExec<FunPtr>::classType* C =
        static_cast<typename LUACFunExec<FunPtr>::classType*>(
            lua_touserdata(L, lua_upvalueindex(2)));
    LUACFunExec<FunPtr>::run(C, fp, L);
    return 0;
  }
};

//=====================
// LUA SCRIPTING CLASS
//=====================

// TODO: Add pointer to member variables and user data.

class LUAScripting
{
public:

  LUAScripting();
  virtual ~LUAScripting();

  /// Function description returned from getFuncDescs().
  struct FunctionDesc
  {
    std::string funcName;   ///< Name of the function.
    std::string funcDesc;   ///< Description of the function provided by the
                            ///< registrar.
    std::string funcSig;    ///< Function signature includes the function name.
  };

  // Ability to unregister all functions?


  /// Return all function descriptions.
  /// This vector can be very large. This function will not generally be used
  /// in performance critical code, otherwise just pass back a reference to
  /// to an internal structure.
  std::vector<FunctionDesc> getAllFuncDescs() const;

  /// Registers a static C++ function with LUA.
  /// Since LUA is compiled as CPP, it is safe to throw exceptions from the
  /// function pointed to by f.
  /// \param  f     Any function pointer.
  ///               f's parameters and return value will be handled
  ///               automatically.
  ///               The number of parameters allowed in f is limited by
  ///               the templates in LUAFunBinding.h. If you need more
  ///               parameters, create the appropriate template in
  ///               LUAFunBinding.h.
  /// \param  name  Period delimited fully qualified name of f inside of LUA.
  ///               No characters other than those regularly allowed inside
  ///               C++ functions are allowed, with the exception of periods.
  ///               Example: "renderer.eye"
  ///               To call a function registered with the name in the example,
  ///               just call: renderer.eye( ... ) in LUA.
  /// \param  desc  Description of f.
  /// TODO: Allow registration of member functions.
  template <typename FunPtr>
  void registerFunction(FunPtr f, const std::string& name,
                        const std::string& desc)
  {
    // Idea: Build a 'callable' table.
    // Its metatable will have a __call metamethod that points to the C
    // function closure.

    // We do this because all metatables are unique per-type which eliminates
    // the possibilty of using a metatable on the function closure itself.
    // The only exception to this rule is the table type itself.
    int initStackTop = lua_gettop(mL);

    // Create a callable function table and leave it on the stack.
    lua_CFunction proxyFunc = &LUACallback<FunPtr, typename
        LUACFunExec<FunPtr>::returnType>::exec;
    createCallableFuncTable(proxyFunc, (void*)f, NULL);

    int tableIndex = lua_gettop(mL);

    // Add function metadata to the table.
    std::string sig = LUACFunExec<FunPtr>::getSignature("");
    std::string sigWithName = LUACFunExec<FunPtr>::getSignature(
        getUnqualifiedName(name));
    populateWithMetadata(name, desc, sig, sigWithName, tableIndex);

    // Push default values for function parameters onto the stack.
    LUACFunExec<FunPtr> defaultParams = LUACFunExec<FunPtr>();
    lua_checkstack(mL, 10); // Max num parameters accepted by the system.
    defaultParams.pushParamsToStack(mL);
    int numFunParams = lua_gettop(mL) - tableIndex;
    createDefaultsAndLastExecTables(tableIndex, numFunParams);

    int testPos = lua_gettop(mL);

    // Install the callable table in the appropriate module based on its
    // fully qualified name.
    bindClosureTableWithFQName(name, tableIndex);

    testPos = lua_gettop(mL);

    lua_pop(mL, 1);   // Pop the callable table.

    assert(initStackTop == lua_gettop(mL));
  }

  // Member function pointers. See above for description of parameters.
  template <typename T, typename FunPtr>
  void registerMemberFunction(T* C, FunPtr f, const std::string& name,
                              const std::string& desc)
  {
    // XXX: Look into an implementation with smart pointers.
    int initStackTop = lua_gettop(mL);

    // Member function pointers are not memory addresses, they are
    // compiler dependent, and need to be copied into lua in an appropriate
    // manner.
    // Create a callable function table and leave it on the stack.
    lua_CFunction proxyFunc = &LUAMemberCallback<FunPtr, typename
        LUACFunExec<FunPtr>::returnType>::exec;
//    createCallableFuncTable(proxyFunc, f, NULL);

    // Table containing the function closure.
    lua_newtable(mL);
    int tableIndex = lua_gettop(mL);

    // Create a new metatable
    lua_newtable(mL);

    // Create a full user data and store the function pointer data inside of it.
    void* udata = lua_newuserdata(mL, sizeof(FunPtr));
    memcpy(udata, &f, sizeof(FunPtr));
    lua_pushlightuserdata(mL, (void*)C);
    lua_pushcclosure(mL, proxyFunc, 2);

    // Associate closure with __call metamethod.
    lua_setfield(mL, -2, "__call");

    // Add boolean to the metatable indicating that this table is a registered
    // function. Used to ensure that we can't register functions 'on top' of
    // other functions.
    // e.g. If we register renderer.eye as a function, without this check, we
    // could also register renderer.eye.ball as a function.
    // While it works just fine, it's confusing, so we're disallowing it.
    lua_pushboolean(mL, 1);
    lua_setfield(mL, -2, "isRegFunc");

    // Associate metatable with primary table.
    lua_setmetatable(mL, -2);

    // Add function metadata to the table.
    std::string sig = LUACFunExec<FunPtr>::getSignature("");
    std::string sigWithName = LUACFunExec<FunPtr>::getSignature(
        getUnqualifiedName(name));
    populateWithMetadata(name, desc, sig, sigWithName, tableIndex);

    // Push default values for function parameters onto the stack.
    LUACFunExec<FunPtr> defaultParams = LUACFunExec<FunPtr>();
    lua_checkstack(mL, 10); // Max num parameters accepted by the system.
    defaultParams.pushParamsToStack(mL);
    int numFunParams = lua_gettop(mL) - tableIndex;
    createDefaultsAndLastExecTables(tableIndex, numFunParams);

    int testPos = lua_gettop(mL);

    // Install the callable table in the appropriate module based on its
    // fully qualified name.
    bindClosureTableWithFQName(name, tableIndex);

    testPos = lua_gettop(mL);

    lua_pop(mL, 1);   // Pop the callable table.

    assert(initStackTop == lua_gettop(mL));
  }

  // This function is to be used only for testing.
  // Upgrade to a shared_ptr if it is to be used outside the LUA scripting
  // system.
  lua_State* getLUAState()  {return mL;}

  // Names for data stored in a function's encapsulating table.
  // Exposed for unit testing purposes.
  static const char* TBL_MD_DESC;         ///< Description
  static const char* TBL_MD_SIG;          ///< Signature
  static const char* TBL_MD_SIG_NAME;     ///< Signature with name
  static const char* TBL_MD_NUM_EXEC;     ///< Number of executions
  static const char* TBL_MD_QNAME;        ///< Fully qualified function name
  static const char* TBL_MD_FUN_PDEFS;    ///< Function parameter defaults
  static const char* TBL_MD_FUN_LAST_EXEC;///< Parameters from last execution

private:

  /// Binds a function to be called when one of the registered LUA functions
  /// execute. Example uses of this function: updating the UI when an undo
  /// is issued (it needs to know what information to update).
  /// \param  f         The function to call when hookTo is executed.
  ///                   Must have the same function signature as hookTo.
  ///                   Will be checked at runtime.
  /// \param  hookTo    The fully qualified name to bind to. A function
  ///                   must already be registered with this hook name.
  ///                   E.G. "render.eye".
  template <typename FunPtr>
  void addHook(FunPtr f, const std::string& hookTo)
  {

  }

  /// Returns true if the table at stackIndex is a registered function.
  bool isRegisteredFunction(int stackIndex) const;

  /// Creates a callable LUA table. classInstance can be NULL.
  /// Leaves the table on the top of the LUA stack.
  void createCallableFuncTable(lua_CFunction proxyFunc,
                               void* realFuncToCall,
                               void* classInstance);

  /// Populates the table at the given index with the given function metadata.
  void populateWithMetadata(const std::string& name,
                            const std::string& description,
                            const std::string& signature,
                            const std::string& signatureWithName,
                            int tableIndex);

  /// Creates the defaults and last exec tables, and places them inside the
  /// table given at tableIndex.
  /// Expects that the parameters are at the top of the stack.
  void createDefaultsAndLastExecTables(int tableIndex, int numParams);

  /// Binds the closure given at closureIndex to the fully qualified name (fq).
  /// ensureModuleExists and bindClosureToTable are helper functions.
  void bindClosureTableWithFQName(const std::string& fqName, int closureIndex);

  /// Retrieves the unqualified name given the qualified name.
  static std::string getUnqualifiedName(const std::string& fqName);

  /// Recursive function helper for getAllFuncDescs.
  void getTableFuncDefs(std::vector<LUAScripting::FunctionDesc>& descs) const;

  /// LUA panic function. LUA calls this when an unrecoverable error occurs
  /// in the interpreter.
  static int luaPanic(lua_State* L);

  /// Customized memory allocator called from within LUA.
  static void* luaInternalAlloc(void* ud, void* ptr, size_t osize, size_t nsize);


  /// The one true LUA state.
  lua_State*                mL;

  /// List of registered modules/functions that in LUA's global table.
  /// Used to iterate through all registered functions and return a description
  /// related to those functions.
  std::vector<std::string>  mRegisteredGlobals;


};


} /* namespace tuvok */
#endif /* LUASCRIPTING_H_ */
