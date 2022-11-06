cmake_minimum_required(VERSION 3.15)
project(ComputerGraphicsThroughOpenGL)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_VERBOSE_MAKEFILE ON)
if(NOT book_version_num)
    set(book_version_num 4) # 3 or 4
endif()
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin/${book_version_num}th)

include(cmake/utils.cmake)

file(GLOB_RECURSE SLN_FILES ${PROJECT_SOURCE_DIR}/ExperimenterSource${book_version_num}th/*.sln)
foreach(sln ${SLN_FILES})
    opengl_add_executable(${sln})
endforeach()