echo "" > configure.win
echo "PKG_CPPFLAGS=-I%CONDA_PREFIX%/Library/include" > src/Makevars.win
echo "PKG_LIBS=-L%CONDA_PREFIX%/Library/lib -lproj" >> src/Makevars.win
"%R%" CMD INSTALL --build .
if errorlevel 1 exit 1
