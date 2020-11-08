cmake_minimum_required(VERSION 3.17)
project(Median_Filtering)

set(CMAKE_CXX_STANDARD 14)

add_executable(Median_Filtering main.cpp EasyBMP/EasyBMP.h EasyBMP/EasyBMP_DataStructures.h EasyBMP/EasyBMP_VariousBMPutilities.h EasyBMP/EasyBMP_BMP.h EasyBMP/EasyBMP.cpp EasyBMP/EasyBMP_ChangeLog.txt)