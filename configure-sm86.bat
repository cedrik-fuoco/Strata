@echo off
call "C:\Program Files\Microsoft Visual Studio\18\Community\VC\Auxiliary\Build\vcvars64.bat"
if errorlevel 1 (echo VCVARS FAILED & exit /b 1)
echo === cl ===
cl 2>&1 | findstr /i version
echo === configure ===
cmake -G Ninja -S "F:\programs\strata-0.2.7.1" -B "F:\programs\strata-0.2.7.1\build-sm86" ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DSTRATA_ENABLE_CUDA=ON ^
  -DCMAKE_CUDA_ARCHITECTURES=86 ^
  -DCMAKE_CUDA_FLAGS=-allow-unsupported-compiler -DCMAKE_CUDA_RUNTIME_LIBRARY=Shared ^
  -DCUDAToolkit_ROOT="C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.6" ^
  -DSTRATA_BUILD_TESTS=OFF
echo === configure rc=%errorlevel% ===
