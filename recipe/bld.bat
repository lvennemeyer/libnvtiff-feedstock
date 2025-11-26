:: Relocate CUDA major specific libraries to single prefix layout

for /f "tokens=1 delims=." %%a in ("%cuda_compiler_version%") do (
    set "CUDA_MAJOR=%%a"
    break
)

@REM move lib lib.backup
@REM move lib.backup\%CUDA_MAJOR% lib

if not exist %PREFIX% mkdir %PREFIX%

move lib\*.lib %LIBRARY_LIB%
move lib\*.dll %LIBRARY_BIN% bin
move include\* %LIBRARY_INC%
