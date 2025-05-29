@echo off
setlocal

set "app_name=test"
set "source_files=src/main.c"
set "vcpkg_root=C:/Users/sincl/Documents/vcpkg"

REM Vcpkg paths - use static libraries to avoid DLL dependencies
set "include_path=%vcpkg_root%\installed\x64-windows-static\include"
set "library_path=%vcpkg_root%\installed\x64-windows-static\lib"

REM Required libraries for raylib on Windows
set "libraries=raylib.lib glfw3.lib opengl32.lib gdi32.lib winmm.lib user32.lib shell32.lib"

REM Compiler flags
set "compile_flags=/nologo /Zi /Fe:%app_name%"
set "link_flags=/DEBUG /subsystem:console"

echo Building %app_name%...
echo Source: %source_files%
echo Include: %include_path%
echo Library: %library_path%

REM Compile and link
cl %compile_flags% %source_files% /I"%include_path%" /link %link_flags% /LIBPATH:"%library_path%" %libraries%

REM Check if build succeeded
if %errorlevel% equ 0 (
    echo.
    echo BUILD SUCCESS!
) else (
    echo.
    echo BUILD FAILED!
    echo Error code: %errorlevel%
)
