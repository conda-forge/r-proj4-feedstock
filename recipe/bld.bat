set "LOCAL_SOFT=%CONDA_PREFIX%/Library/include"
set "PATH=%CONDA_PREFIX%/Library/lib;%PATH%"
"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1
