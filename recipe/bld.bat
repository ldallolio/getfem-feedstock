@echo on

echo "**************** G E T F E M  B U I L D  S T A R T S  H E R E ****************"

rem bash -lc "autoreconf -fi"
rem if errorlevel 1 exit 1

set MAKE=mingw32-make

bash -c "alias make=mingw32-make && ./configure --prefix=`cygpath -u $PREFIX` --bindir=`cygpath -u $LIBRARY_BIN` --libdir=`cygpath -u $LIBRARY_LIB` PYTHON=`which python` --enable-shared --disable-dependency-tracking --disable-python" # --enable-octave
if errorlevel 1 exit 1

mingw32-make -j %CPU_COUNT%
if errorlevel 1 exit 1

mingw32-make install
if errorlevel 1 exit 1

mingw32-make check -j %CPU_COUNT%
if errorlevel 1 exit 1

echo "**************** G E T F E M  B U I L D  E N D S  H E R E ****************"
