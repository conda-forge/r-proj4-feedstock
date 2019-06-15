"set LOCAL_SOFT=%CONDA_PREFIX%\Library"
copy %CONDA_PREFIX%\Library\lib\proj.a .
REM mkdir win32 win64
REM copy %CONDA_PREFIX%\Library\lib\proj.a win32
REM copy %CONDA_PREFIX%\Library\include\proj_api.h win32
REM copy %CONDA_PREFIX%\Library\lib\proj.a win64
REM copy %CONDA_PREFIX%\Library\include\proj_api.h win64
"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1
