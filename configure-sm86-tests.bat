@echo off
rem fix-layer-major-long-context: the sm86 engine build has STRATA_BUILD_TESTS=OFF, so the parity tests are not
rem configured in it.  This re-configures the SAME build dir with tests on (same generator, same compiler, same
rem CUDA arch: only the test targets are added), so `ninja strata` must still say "no work to do" afterwards.
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 (echo VCVARS FAILED & exit /b 1)
cmake -G Ninja -S "F:\programs\strata-0.2.7.1" -B "F:\programs\strata-0.2.7.1\build-sm86" -DSTRATA_BUILD_TESTS=ON
echo === configure rc=%errorlevel% ===
