#############################################################################
# Makefile for building: Build/OSX/Bin/ImageVis3D.app/Contents/MacOS/ImageVis3D
# Generated by qmake (2.01a) (Qt 4.4.3) on: Do Nov 27 17:09:46 2008
# Project:  ImageVis3D.pro
# Template: app
# Command: /usr/bin/qmake -macx -o ImageVis3D.xcodeproj/project.pbxproj ImageVis3D.pro
#############################################################################

MOC       = /Developer/Tools/Qt/moc
UIC       = /Developer/Tools/Qt/uic
LEX       = flex
LEXFLAGS  = 
YACC      = yacc
YACCFLAGS = -d
DEFINES       = -DQT_OPENGL_LIB -DQT_GUI_LIB -DQT_CORE_LIB -DQT_SHARED
INCPATH       = -I/usr/local/Qt4.4/mkspecs/macx-xcode -I. -I/Library/Frameworks/QtCore.framework/Versions/4/Headers -I/usr/include/QtCore -I/Library/Frameworks/QtGui.framework/Versions/4/Headers -I/usr/include/QtGui -I/Library/Frameworks/QtOpenGL.framework/Versions/4/Headers -I/usr/include/QtOpenGL -I/usr/include -I. -I/System/Library/Frameworks/OpenGL.framework/Versions/A/Headers -I/System/Library/Frameworks/AGL.framework/Headers -IUI/AutoGen -IUI/AutoGen -I/usr/local/include -I/System/Library/Frameworks/CarbonCore.framework/Headers
DEL_FILE  = rm -f
MOVE      = mv -f

IMAGES = 
PARSERS =
preprocess: $(PARSERS) compilers
clean preprocess_clean: parser_clean compiler_clean

parser_clean:
mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compilers: UI/AutoGen/moc_SettingsDlg.cpp UI/AutoGen/moc_BrowseData.cpp UI/AutoGen/moc_ImageVis3D.cpp\
	 UI/AutoGen/moc_PleaseWait.cpp UI/AutoGen/moc_QTransferFunction.cpp UI/AutoGen/moc_Q1DTransferFunction.cpp\
	 UI/AutoGen/moc_Q2DTransferFunction.cpp UI/AutoGen/moc_RenderWindow.cpp UI/AutoGen/ui_BrowseData.h UI/AutoGen/ui_ImageVis3D.h UI/AutoGen/ui_PleaseWait.h\
	 UI/AutoGen/ui_SettingsDlg.h
compiler_objective_c_make_all:
compiler_objective_c_clean:
compiler_moc_header_make_all: UI/AutoGen/moc_SettingsDlg.cpp UI/AutoGen/moc_BrowseData.cpp UI/AutoGen/moc_ImageVis3D.cpp UI/AutoGen/moc_PleaseWait.cpp UI/AutoGen/moc_QTransferFunction.cpp UI/AutoGen/moc_Q1DTransferFunction.cpp UI/AutoGen/moc_Q2DTransferFunction.cpp UI/AutoGen/moc_RenderWindow.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) UI/AutoGen/moc_SettingsDlg.cpp UI/AutoGen/moc_BrowseData.cpp UI/AutoGen/moc_ImageVis3D.cpp UI/AutoGen/moc_PleaseWait.cpp UI/AutoGen/moc_QTransferFunction.cpp UI/AutoGen/moc_Q1DTransferFunction.cpp UI/AutoGen/moc_Q2DTransferFunction.cpp UI/AutoGen/moc_RenderWindow.cpp
UI/AutoGen/moc_SettingsDlg.cpp: Controller/MasterController.h \
		IO/IOManager.h \
		Renderer/AbstrRenderer.h \
		StdDefines.h \
		IO/VolumeDataset.h \
		IO/TransferFunction1D.h \
		IO/TransferFunction2D.h \
		IO/UVF/UVF.h \
		IO/UVF/UVFTables.h \
		IO/UVF/UVFBasic.h \
		IO/UVF/LargeRAWFile.h \
		Basics/MathTools.h \
		Basics/EndianConvert.h \
		IO/UVF/DataBlock.h \
		IO/UVF/GlobalHeader.h \
		IO/UVF/RasterDataBlock.h \
		DebugOut/AbstrDebugOut.h \
		IO/UVF/KeyValuePairDataBlock.h \
		IO/UVF/Histogram1DDataBlock.h \
		IO/UVF/Histogram2DDataBlock.h \
		IO/UVF/MaxMinDataBlock.h \
		Basics/Vectors.h \
		Renderer/CullingLOD.h \
		IO/DirectoryParser.h \
		DebugOut/ConsoleOut.h \
		Renderer/GPUMemMan/GPUMemMan.h \
		Renderer/GPUMemMan/GPUMemManDataStructs.h \
		Renderer/GLTexture1D.h \
		Renderer/GLTexture.h \
		Renderer/GLObject.h \
		Renderer/GLInclude.h \
		3rdParty/GLEW/glew.h \
		3rdParty/GLEW/wglew.h \
		Renderer/GLTexture2D.h \
		Renderer/GLTexture3D.h \
		Renderer/GLFBOTex.h \
		Renderer/GLSLProgram.h \
		Basics/SystemInfo.h \
		Renderer/GLSBVR.h \
		Renderer/GLRenderer.h \
		Renderer/SBVRGeogen.h \
		Renderer/GLRaycaster.h \
		UI/AutoGen/ui_SettingsDlg.h \
		UI/SettingsDlg.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/SettingsDlg.h -o UI/AutoGen/moc_SettingsDlg.cpp

UI/AutoGen/moc_BrowseData.cpp: UI/RenderWindow.h \
		Controller/MasterController.h \
		IO/IOManager.h \
		Renderer/AbstrRenderer.h \
		StdDefines.h \
		IO/VolumeDataset.h \
		IO/TransferFunction1D.h \
		IO/TransferFunction2D.h \
		IO/UVF/UVF.h \
		IO/UVF/UVFTables.h \
		IO/UVF/UVFBasic.h \
		IO/UVF/LargeRAWFile.h \
		Basics/MathTools.h \
		Basics/EndianConvert.h \
		IO/UVF/DataBlock.h \
		IO/UVF/GlobalHeader.h \
		IO/UVF/RasterDataBlock.h \
		DebugOut/AbstrDebugOut.h \
		IO/UVF/KeyValuePairDataBlock.h \
		IO/UVF/Histogram1DDataBlock.h \
		IO/UVF/Histogram2DDataBlock.h \
		IO/UVF/MaxMinDataBlock.h \
		Basics/Vectors.h \
		Renderer/CullingLOD.h \
		IO/DirectoryParser.h \
		DebugOut/ConsoleOut.h \
		Renderer/GPUMemMan/GPUMemMan.h \
		Renderer/GPUMemMan/GPUMemManDataStructs.h \
		Renderer/GLTexture1D.h \
		Renderer/GLTexture.h \
		Renderer/GLObject.h \
		Renderer/GLInclude.h \
		3rdParty/GLEW/glew.h \
		3rdParty/GLEW/wglew.h \
		Renderer/GLTexture2D.h \
		Renderer/GLTexture3D.h \
		Renderer/GLFBOTex.h \
		Renderer/GLSLProgram.h \
		Basics/SystemInfo.h \
		Renderer/GLSBVR.h \
		Renderer/GLRenderer.h \
		Renderer/SBVRGeogen.h \
		Renderer/GLRaycaster.h \
		Basics/ArcBall.h \
		UI/AutoGen/ui_BrowseData.h \
		UI/QDataRadioButton.h \
		UI/BrowseData.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/BrowseData.h -o UI/AutoGen/moc_BrowseData.cpp

UI/AutoGen/moc_ImageVis3D.cpp: StdDefines.h \
		Controller/MasterController.h \
		IO/IOManager.h \
		Renderer/AbstrRenderer.h \
		IO/VolumeDataset.h \
		IO/TransferFunction1D.h \
		IO/TransferFunction2D.h \
		IO/UVF/UVF.h \
		IO/UVF/UVFTables.h \
		IO/UVF/UVFBasic.h \
		IO/UVF/LargeRAWFile.h \
		Basics/MathTools.h \
		Basics/EndianConvert.h \
		IO/UVF/DataBlock.h \
		IO/UVF/GlobalHeader.h \
		IO/UVF/RasterDataBlock.h \
		DebugOut/AbstrDebugOut.h \
		IO/UVF/KeyValuePairDataBlock.h \
		IO/UVF/Histogram1DDataBlock.h \
		IO/UVF/Histogram2DDataBlock.h \
		IO/UVF/MaxMinDataBlock.h \
		Basics/Vectors.h \
		Renderer/CullingLOD.h \
		IO/DirectoryParser.h \
		DebugOut/ConsoleOut.h \
		Renderer/GPUMemMan/GPUMemMan.h \
		Renderer/GPUMemMan/GPUMemManDataStructs.h \
		Renderer/GLTexture1D.h \
		Renderer/GLTexture.h \
		Renderer/GLObject.h \
		Renderer/GLInclude.h \
		3rdParty/GLEW/glew.h \
		3rdParty/GLEW/wglew.h \
		Renderer/GLTexture2D.h \
		Renderer/GLTexture3D.h \
		Renderer/GLFBOTex.h \
		Renderer/GLSLProgram.h \
		Basics/SystemInfo.h \
		Renderer/GLSBVR.h \
		Renderer/GLRenderer.h \
		Renderer/SBVRGeogen.h \
		Renderer/GLRaycaster.h \
		UI/AutoGen/ui_ImageVis3D.h \
		UI/RenderWindow.h \
		Basics/ArcBall.h \
		UI/Q1DTransferFunction.h \
		UI/QTransferFunction.h \
		UI/Q2DTransferFunction.h \
		DebugOut/QTOut.h \
		UI/SettingsDlg.h \
		UI/AutoGen/ui_SettingsDlg.h \
		UI/ImageVis3D.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/ImageVis3D.h -o UI/AutoGen/moc_ImageVis3D.cpp

UI/AutoGen/moc_PleaseWait.cpp: UI/AutoGen/ui_PleaseWait.h \
		UI/PleaseWait.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/PleaseWait.h -o UI/AutoGen/moc_PleaseWait.cpp

UI/AutoGen/moc_QTransferFunction.cpp: UI/QTransferFunction.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/QTransferFunction.h -o UI/AutoGen/moc_QTransferFunction.cpp

UI/AutoGen/moc_Q1DTransferFunction.cpp: UI/QTransferFunction.h \
		IO/TransferFunction1D.h \
		UI/Q1DTransferFunction.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/Q1DTransferFunction.h -o UI/AutoGen/moc_Q1DTransferFunction.cpp

UI/AutoGen/moc_Q2DTransferFunction.cpp: UI/QTransferFunction.h \
		IO/TransferFunction1D.h \
		IO/TransferFunction2D.h \
		UI/Q2DTransferFunction.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/Q2DTransferFunction.h -o UI/AutoGen/moc_Q2DTransferFunction.cpp

UI/AutoGen/moc_RenderWindow.cpp: Controller/MasterController.h \
		IO/IOManager.h \
		Renderer/AbstrRenderer.h \
		StdDefines.h \
		IO/VolumeDataset.h \
		IO/TransferFunction1D.h \
		IO/TransferFunction2D.h \
		IO/UVF/UVF.h \
		IO/UVF/UVFTables.h \
		IO/UVF/UVFBasic.h \
		IO/UVF/LargeRAWFile.h \
		Basics/MathTools.h \
		Basics/EndianConvert.h \
		IO/UVF/DataBlock.h \
		IO/UVF/GlobalHeader.h \
		IO/UVF/RasterDataBlock.h \
		DebugOut/AbstrDebugOut.h \
		IO/UVF/KeyValuePairDataBlock.h \
		IO/UVF/Histogram1DDataBlock.h \
		IO/UVF/Histogram2DDataBlock.h \
		IO/UVF/MaxMinDataBlock.h \
		Basics/Vectors.h \
		Renderer/CullingLOD.h \
		IO/DirectoryParser.h \
		DebugOut/ConsoleOut.h \
		Renderer/GPUMemMan/GPUMemMan.h \
		Renderer/GPUMemMan/GPUMemManDataStructs.h \
		Renderer/GLTexture1D.h \
		Renderer/GLTexture.h \
		Renderer/GLObject.h \
		Renderer/GLInclude.h \
		3rdParty/GLEW/glew.h \
		3rdParty/GLEW/wglew.h \
		Renderer/GLTexture2D.h \
		Renderer/GLTexture3D.h \
		Renderer/GLFBOTex.h \
		Renderer/GLSLProgram.h \
		Basics/SystemInfo.h \
		Renderer/GLSBVR.h \
		Renderer/GLRenderer.h \
		Renderer/SBVRGeogen.h \
		Renderer/GLRaycaster.h \
		Basics/ArcBall.h \
		UI/RenderWindow.h
	/Developer/Tools/Qt/moc $(DEFINES) $(INCPATH) -D__APPLE__ -D__GNUC__ UI/RenderWindow.h -o UI/AutoGen/moc_RenderWindow.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_rez_source_make_all:
compiler_rez_source_clean:
compiler_uic_make_all: UI/AutoGen/ui_BrowseData.h UI/AutoGen/ui_ImageVis3D.h UI/AutoGen/ui_PleaseWait.h UI/AutoGen/ui_SettingsDlg.h
compiler_uic_clean:
	-$(DEL_FILE) UI/AutoGen/ui_BrowseData.h UI/AutoGen/ui_ImageVis3D.h UI/AutoGen/ui_PleaseWait.h UI/AutoGen/ui_SettingsDlg.h
UI/AutoGen/ui_BrowseData.h: UI/UI/BrowseData.ui
	/Developer/Tools/Qt/uic UI/UI/BrowseData.ui -o UI/AutoGen/ui_BrowseData.h

UI/AutoGen/ui_ImageVis3D.h: UI/UI/ImageVis3D.ui
	/Developer/Tools/Qt/uic UI/UI/ImageVis3D.ui -o UI/AutoGen/ui_ImageVis3D.h

UI/AutoGen/ui_PleaseWait.h: UI/UI/PleaseWait.ui
	/Developer/Tools/Qt/uic UI/UI/PleaseWait.ui -o UI/AutoGen/ui_PleaseWait.h

UI/AutoGen/ui_SettingsDlg.h: UI/UI/SettingsDlg.ui
	/Developer/Tools/Qt/uic UI/UI/SettingsDlg.ui -o UI/AutoGen/ui_SettingsDlg.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

