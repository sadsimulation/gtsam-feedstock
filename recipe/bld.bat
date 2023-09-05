mkdir build
cd build

cmake ^
    -GNinja ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DGTSAM_BUILD_UNSTABLE:OPTION=ON ^
    -DGTSAM_BUILD_STATIC_LIBRARY=OFF ^
    -DGTSAM_BUILD_WITH_MARCH_NATIVE=OFF ^
    -DGTSAM_USE_SYSTEM_EIGEN=ON ^
    -DGTSAM_INSTALL_CPPUNITLITE=OFF ^
    -DGTSAM_BUILD_PYTHON=OFF ^
    -DGTSAM_USE_SYSTEM_METIS=ON ^
    -DBoost_USE_STATIC_LIBS=OFF ^
    -DBOOST_ROOT="%LIBRARY_PREFIX%" ^
    -DGTSAM_CMAKE_CONFIGURATION_TYPES="Release" ^
    -DCMAKE_BUILD_TYPE="Release" ^
    -DPython3_EXECUTABLE=%PYTHON% ^
    -DPython_EXECUTABLE=%PYTHON% ^
    -DPYTHON_EXECUTABLE=%PYTHON% ^
    %SRC_DIR%

if errorlevel 1 exit 1

ninja install -j2
@rem ninja python-install

if errorlevel 1 exit 1

@rem ninja check
