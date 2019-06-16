"%R%" CMD INSTALL --build --configure-vars="LOCAL_SOFT=%CONDA_PREFIX%/Library/include" .
if errorlevel 1 exit 1
