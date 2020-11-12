//
// Created by elek34ka on 08/11/2020.
//

#ifndef MEDIAN_FILTERING_MEDIANFILTER_H
#define MEDIAN_FILTERING_MEDIANFILTER_H
#include <iostream>
#include "EasyBMP/EasyBMP.h"
#include <vector>
#include <algorithm>
#include <cuda.h>


const int iterations = 1;
const int offset = 1;

void MedianFilter(BMP &image, BMP &result_image);

bool MedianFilterGPU(BMP &image, BMP &result_image);

#endif //MEDIAN_FILTERING_MEDIANFILTER_H
