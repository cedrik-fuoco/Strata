@echo off
rem fix-layer-major-long-context: build one test target in the sm86 build dir (configured with STRATA_BUILD_TESTS=ON
rem by configure-sm86-tests.bat) and run it through ctest.  Usage: build-test-sm86.bat hc_q8_stream_test hc_q8_stream
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 (echo VCVARS FAILED & exit /b 1)
cmake --build "F:\programs\strata-0.2.7.1\build-sm86" --target %1 -j 8
if errorlevel 1 (echo === build failed === & exit /b 1)
cd /d "F:\programs\strata-0.2.7.1\build-sm86"
ctest -R %2 --output-on-failure
echo === ctest rc=%errorlevel% ===
