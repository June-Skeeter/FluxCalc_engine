@echo off
setlocal

:: Get root directory of the batch script
set "rootdir=%~dp0"
:: Remove trailing backslash if present
if "%rootdir:~-1%"=="\" set "rootdir=%rootdir:~0,-1%"


:: Remove and recreate custom\binOut
if exist "%rootdir%\custom\binOut" (
    rmdir /s /q "%rootdir%\custom\binOut"
)
mkdir "%rootdir%\custom\binOut"

:: Remove and recreate tmp
if exist "%rootdir%\tmp" (
    rmdir /s /q "%rootdir%\tmp"
)
mkdir "%rootdir%\tmp"


:: If first argument is "make"
if "%1"=="make" (
    rmdir /s /q "%rootdir%\eddypro-engine\bin"
    rmdir /s /q "%rootdir%\eddypro-engine\obj"

    pushd "%rootdir%\eddypro-engine\prj"
    make rp
    make fcc
    copy "%rootdir%\7za" "%rootdir%\eddypro-engine\prj\bin"
    popd
)


:: Run the program
pushd "%rootdir%\eddypro-engine"
"%rootdir%\eddypro-engine\bin\win\eddypro_rp" -s win "%rootdir%\custom\SCL_ecf32_win.eddypro"
popd

endlocal

@REM cd ./eddypro-engine/prj
@REM rmdir /s /q ..\bin ..\obj
@REM make rp
@REM cd ../../
@REM .\eddypro-engine\bin\win\eddypro_rp.exe -s win C:\Users\User\EP_API_Test\custom\BinTest_win.eddypro