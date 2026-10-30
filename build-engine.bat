@echo off
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat" >nul
cmake --build "F:\programs\strata-0.2.7.1\build-sm86" --target strata -j 12
echo === build rc=%errorlevel% ===
