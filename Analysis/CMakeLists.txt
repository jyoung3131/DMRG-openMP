##########################################
# CMake Updated: 19th March, 2018
# 
##########################################

cmake_minimum_required (VERSION 2.6)

#project name
project (libAnalysis)

#set(CMAKE_CXX_COMPILER /sw/summitdev/llvm/20170502/clang/20170502/bin/clang)

#For XLC
#set(CMAKE_CXX_COMPILER /sw/summitdev/xl/20161123/xlC/13.1.5/bin/xlc++)
##set(CMAKE_CXX_COMPILER /sw/summitdev/xl/20170606-beta/xlC/14.1.0/bin/xlc++)

#For GCC:
#set(CMAKE_CXX_COMPILER /sw/summitdev/gcc/6.3.1-20170301/bin/g++)
#set(CMAKE_CXX_COMPILER /sw/summitdev/gcc/5.4.0new/bin/g++)

#C++ 11 support -- Must have cmake > 3.0
set (CMAKE_CXX_STANDARD 11)

#For XLC
#set (CMAKE_CXX_FLAGS "-std=gnu++11")

#Add compiler flags 
set (CMAKE_CXX_FLAGS "-g -O3")
set (CMAKE_CXX_FLAGS "-std=gnu++11")

#Build the utility library, libAnalysis.a
#Glob for the source and header files
FILE (GLOB ANALYSIS_C_FILES *.c)
FILE (GLOB ANALYSIS_H_FILES *.h)
SET (ANALYSIS_SRC_FILES ${ANALYSIS_C_FILES} ${ANALYSIS_H_FILES})

#Point to the appropriate include directories for this library
#target_include_directories (libAnalysis PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

#Build the static library
ADD_LIBRARY( Analysis STATIC ${ANALYSIS_SRC_FILES})

