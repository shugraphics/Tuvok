######################################################################
# Generated by Jens Krueger
######################################################################

TEMPLATE          = app
unix:TARGET       = Build/Linux/Bin/ImageVis3D
win32:TARGET      = Build/Win32/Bin/ImageVis3D
mac:TARGET        = Build/OSX/Bin/ImageVis3D
unix:RCC_DIR      = Build/Linux
win32:RCC_DIR     = Build/Win32
mac:RCC_DIR       = Build/OSX
unix:OBJECTS_DIR  = Build/Linux
win32:OBJECTS_DIR = Build/Win32
mac:OBJECTS_DIR   = Build/OSX
UI_DIR            = UI/AutoGen
MOC_DIR           = UI/AutoGen
DEPENDPATH       += .
INCLUDEPATH      += .
QT               += opengl

# Input
HEADERS += StdDefines.h \
           Basics/Grids.h \
           Basics/SysTools.h \
           Basics/Vectors.h \
           Basics/MathTools.h \
           Basics/Checksums/MD5.h \
           Basics/Checksums/crc32.h \
           UI/SettingsDlg.h \
           UI/BrowseData.h \
           UI/ImageVis3D.h \
           UI/PleaseWait.h \
           UI/QTransferFunction.h \
           UI/Q1DTransferFunction.h \
           UI/Q2DTransferFunction.h \
           UI/QDataRadioButton.h \
           UI/RenderWindow.h \
           IO/DirectoryParser.h \
           IO/KeyValueFileParser.h \
           IO/Transferfunction1D.h \
           IO/Transferfunction2D.h \
           IO/VolumeDataset.h \
           IO/IOManager.h \          
           IO/Images/BMPLoader.h \
           IO/UVF/DataBlock.h \
           IO/UVF/GlobalHeader.h \
           IO/UVF/KeyValuePairDataBlock.h \
           IO/UVF/LargeRAWFile.h \
           IO/UVF/RasterDataBlock.h \
           IO/UVF/UVF.h \
           IO/UVF/UVFBasic.h \
           IO/UVF/UVFTables.h \
           IO/UVF/Histogram1DDataBlock.h \
           IO/UVF/Histogram2DDataBlock.h \
           Controller/MasterController.h \
           DebugOut/AbstrDebugOut.h \
           DebugOut/TextfileOut.h \
           DebugOut/QTOut.h \
           DebugOut/ConsoleOut.h \
           DebugOut/MultiplexOut.h \
           3rdParty/GLEW/glew.h \
           3rdParty/GLEW/glxew.h \
           Renderer/GLSLProgram.h \
           Renderer/GLInclude.h \
           Renderer/GLObject.h \
           Renderer/GLTexture.h \
           Renderer/GLTexture1D.h \
           Renderer/GLTexture2D.h \
           Renderer/GLTexture3D.h \
           Renderer/GLRenderer.h \
           Renderer/AbstrRenderer.h \
           Renderer/GPUSBVR.h \
           Renderer/GPUMemMan/GPUMemMan.h \
           Renderer/GPUMemMan/GPUMemManDataStructs.h \
           Renderer/SBVRGeogen.h

FORMS += UI/UI/BrowseData.ui UI/UI/ImageVis3D.ui UI/UI/PleaseWait.ui UI/UI/SettingsDlg.ui

SOURCES += 3rdParty/GLEW/glew.c \
           Basics/SystemInfo.cpp \
           Basics/SysTools.cpp \
           Basics/MathTools.cpp \           
           Basics/Checksums/MD5.cpp \
           UI/BrowseData.cpp \
           UI/ImageVis3D.cpp \
           UI/ImageVis3D_1DTransferFunction.cpp \
           UI/ImageVis3D_2DTransferFunction.cpp \
           UI/ImageVis3D_FileHandling.cpp \
           UI/ImageVis3D_WindowHandling.cpp \
           UI/ImageVis3D_DebugWindow.cpp \
           UI/ImageVis3D_Settings.cpp \
           UI/PleaseWait.cpp \
           UI/QTransferFunction.cpp \
           UI/Q1DTransferFunction.cpp \
           UI/Q2DTransferFunction.cpp \
           UI/QDataRadioButton.cpp \
           UI/RenderWindow.cpp \
           UI/SettingsDlg.cpp \
           IO/KeyValueFileParser.cpp \           
           IO/Transferfunction1D.cpp \
           IO/Transferfunction2D.cpp \
           IO/VolumeDataset.cpp \
           IO/IOManager.cpp \
           IO/DirectoryParser.cpp \
           IO/DICOM/DICOMParser.cpp \
           IO/UVF/DataBlock.cpp \
           IO/UVF/GlobalHeader.cpp \
           IO/UVF/KeyValuePairDataBlock.cpp \
           IO/UVF/LargeRAWFile.cpp \
           IO/UVF/RasterDataBlock.cpp \
           IO/UVF/UVF.cpp \
           IO/UVF/UVFTables.cpp \
           IO/UVF/Histogram1DDataBlock.cpp \
           IO/UVF/Histogram2DDataBlock.cpp \                     
           Controller/MasterController.cpp \
           DebugOut/TextfileOut.cpp \
           DebugOut/QTOut.cpp \
           DebugOut/ConsoleOut.cpp \
           DebugOut/MultiplexOut.cpp \ 
           Renderer/GLSLProgram.cpp \                    
           Renderer/GLTexture.cpp \
           Renderer/GLTexture1D.cpp \
           Renderer/GLTexture2D.cpp \
           Renderer/GLTexture3D.cpp \
           Renderer/GLRenderer.cpp \           
           Renderer/AbstrRenderer.cpp \
           Renderer/GPUSBVR.cpp \
           Renderer/GPUMemMan/GPUMemMan.cpp \
           Renderer/GPUMemMan/GPUMemManDataStructs.cpp \
           Renderer/SBVRGeogen.cpp \  
           Renderer/GLFBOTex.cpp \  
           main.cpp
