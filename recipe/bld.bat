copy %CONDA_PREFIX%\Library\lib\proj.a %LIBRARY_LIB%
copy %CONDA_PREFIX%\Library\include\proj_api.h %LIBRARY_INC%
"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1
