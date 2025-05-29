@echo off
setlocal

echo Cleaning build artifacts...

REM Remove executable files

if exist *.exe (
   echo Removing executables...
   del /q *.exe
)

if exist *.pdb (
    echo Removing debug files...
    del /q *.pdb
)

if exist *.ilk (
    echo Removing incremental linker files...
    del /q *.ilk
)

if exist *.obj (
    echo Removing object files...
    del /q *.obj
)

if exist *.idb (
    echo Removing compiler database files...
    del /q *.idb
)

if exist *.manifest (
    echo Removing manifest files...
    del /q *.manifest
)

if exist *.tmp (
    echo Removing temporary files...
    del /q *.tmp
)

if exist *.sarif (
    echo Removing code analysis files...
    del /q *.sarif
)

if exist Debug (
    echo Removing Debug directory...
    rmdir /s /q Debug
)

if exist Release (
    echo Removing Release directory...
    rmdir /s /q Release
)

dir /s /b *~ >nul 2>&1 && (
    echo Found Emacs backup files, deleting...
    del /s /q *~
) || (
    echo No Emacs backup files found
)

echo.
echo Clean completed!
echo.
