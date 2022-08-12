cmake_minimum_required(VERSION 3.14)
project(powershell LANGUAGES CXX)

set(INSTALL_POWERSHELL_DIR "${CMAKE_INSTALL_PREFIX}/powershell")

set(POWERSHELL_MODULES_DIR "${CMAKE_CURRENT_SOURCE_DIR}/modules")
if(EXISTS "${POWERSHELL_MODULES_DIR}")
  install(DIRECTORY "${POWERSHELL_MODULES_DIR}" DESTINATION "${INSTALL_POWERSHELL_DIR}"
    COMPONENT Runtime)
endif()

# copy to build folder
# file(COPY Gamebay.Shell DESTINATION powershell)
