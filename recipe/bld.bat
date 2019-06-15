mkdir win32 win64
copy %CONDA_PREFIX%\Library\lib\proj.a win32
copy %CONDA_PREFIX%\Library\include\proj_api.h win32
copy %CONDA_PREFIX%\Library\lib\proj.a win64
copy %CONDA_PREFIX%\Library\include\proj_api.h win64
"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1
