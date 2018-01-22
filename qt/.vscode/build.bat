@echo off
set QT_QMAKE_PATH=C:\Qt\Qt5.8.0\5.8\msvc2015\bin\qmake.exe
set QT_CREATE_PATH=C:\Qt\Qt5.8.0\Tools\QtCreator\bin
set VC_INSTALLDIR=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC
set RC_PATH=C:\Program Files (x86)\Windows Kits\8.1\bin\x86

set QT_PRO_NAME=AudioDemos

:: visual studio environment
set PATH=%VC_INSTALLDIR%\bin;%RC_PATH%;%PATH%
call "%VC_INSTALLDIR%\vcvarsall.bat"

:: work dir
set PRO_FILE_PATH=%cd%\src\%QT_PRO_NAME%.pro
echo %PRO_FILE_PATH%

:: build path
mkdir build
cd build

:: compile
%QT_QMAKE_PATH% %PRO_FILE_PATH% -spec win32-msvc2015 "CONFIG+=debug" "CONFIG+=qml_debug"
%QT_CREATE_PATH%\jom.exe qmake_all
%QT_CREATE_PATH%\jom.exe