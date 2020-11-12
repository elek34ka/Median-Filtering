#include <cuda.h>
#include <cuda_runtime_api.h>

#include "EasyBMP/EasyBMP.h"
#include "EasyBMP/EasyBMP_BMP.h"
#include <thrust/sort.h>

#include "MedianFilter.h"



__host__ void
medianFilterKernel(BMP &image, BMP &result_image, int width, int height) {

    int n = (offset+2)*(offset+2);
    float filter[n];
    RGBApixel colours[n];

    for (int i = offset; i < height - offset; i++) {
        for (int j = offset; j < width - offset; j++) {
            int count = 0;
            for (int x = -offset; x <= offset; x++)
                for (int y = -offset; y <= offset; y++) {
                    if (x + i < height && x + i >= 0 &&
                        y + j >= 0 && y + j < width) {

                        RGBApixel pixel = image.GetPixel(x + i, y + j);

                        float rgb_value =
                                (float) pixel.Red * 0.11f + (float) pixel.Green * 0.59f + (float) pixel.Blue * 0.3f;

                        filter[count] = rgb_value;
                        colours[count] = pixel;
                    }
                }

            thrust::sort_by_key(filter, filter + n, colours);

            result_image.SetPixel(i, j, colours[n/2]);

        }
    }
    result_image.SetBitDepth(32);
}
/*

__global__ void
medianFilterSharedKernel(unsigned char *inputImageKernel, unsigned char *outputImagekernel, int imageWidth,
                         int imageHeight) {
    //Set the row and col value for each thread.
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    __shared__ unsigned char sharedmem[(TILE_SIZE + 2)][(TILE_SIZE + 2)];  //initialize shared memory
    //Take some values.
    bool is_x_left = (threadIdx.x == 0), is_x_right = (threadIdx.x == TILE_SIZE - 1);
    bool is_y_top = (threadIdx.y == 0), is_y_bottom = (threadIdx.y == TILE_SIZE - 1);

    //Initialize with zero
    if (is_x_left)
        sharedmem[threadIdx.x][threadIdx.y + 1] = 0;
    else if (is_x_right)
        sharedmem[threadIdx.x + 2][threadIdx.y + 1] = 0;
    if (is_y_top) {
        sharedmem[threadIdx.x + 1][threadIdx.y] = 0;
        if (is_x_left)
            sharedmem[threadIdx.x][threadIdx.y] = 0;
        else if (is_x_right)
            sharedmem[threadIdx.x + 2][threadIdx.y] = 0;
    } else if (is_y_bottom) {
        sharedmem[threadIdx.x + 1][threadIdx.y + 2] = 0;
        if (is_x_right)
            sharedmem[threadIdx.x + 2][threadIdx.y + 2] = 0;
        else if (is_x_left)
            sharedmem[threadIdx.x][threadIdx.y + 2] = 0;
    }

    //Setup pixel values
    sharedmem[threadIdx.x + 1][threadIdx.y + 1] = inputImageKernel[row * imageWidth + col];
    //Check for boundry conditions.
    if (is_x_left && (col > 0))
        sharedmem[threadIdx.x][threadIdx.y + 1] = inputImageKernel[row * imageWidth + (col - 1)];
    else if (is_x_right && (col < imageWidth - 1))
        sharedmem[threadIdx.x + 2][threadIdx.y + 1] = inputImageKernel[row * imageWidth + (col + 1)];
    if (is_y_top && (row > 0)) {
        sharedmem[threadIdx.x + 1][threadIdx.y] = inputImageKernel[(row - 1) * imageWidth + col];
        if (is_x_left)
            sharedmem[threadIdx.x][threadIdx.y] = inputImageKernel[(row - 1) * imageWidth + (col - 1)];
        else if (is_x_right)
            sharedmem[threadIdx.x + 2][threadIdx.y] = inputImageKernel[(row - 1) * imageWidth + (col + 1)];
    } else if (is_y_bottom && (row < imageHeight - 1)) {
        sharedmem[threadIdx.x + 1][threadIdx.y + 2] = inputImageKernel[(row + 1) * imageWidth + col];
        if (is_x_right)
            sharedmem[threadIdx.x + 2][threadIdx.y + 2] = inputImageKernel[(row + 1) * imageWidth + (col + 1)];
        else if (is_x_left)
            sharedmem[threadIdx.x][threadIdx.y + 2] = inputImageKernel[(row + 1) * imageWidth + (col - 1)];
    }

    __syncthreads();   //Wait for all threads to be done.

    //Setup the filter.
    unsigned char filterVector[9] = {sharedmem[threadIdx.x][threadIdx.y], sharedmem[threadIdx.x + 1][threadIdx.y],
                                     sharedmem[threadIdx.x + 2][threadIdx.y],
                                     sharedmem[threadIdx.x][threadIdx.y + 1],
                                     sharedmem[threadIdx.x + 1][threadIdx.y + 1],
                                     sharedmem[threadIdx.x + 2][threadIdx.y + 1],
                                     sharedmem[threadIdx.x][threadIdx.y + 2],
                                     sharedmem[threadIdx.x + 1][threadIdx.y + 2],
                                     sharedmem[threadIdx.x + 2][threadIdx.y + 2]};


    {
        for (int i = 0; i < 9; i++) {
            for (int j = i + 1; j < 9; j++) {
                if (filterVector[i] > filterVector[j]) {
                    //Swap Values.
                    char tmp = filterVector[i];
                    filterVector[i] = filterVector[j];
                    filterVector[j] = tmp;
                }
            }
        }
        outputImagekernel[row * imageWidth + col] = filterVector[4];   //Set the output image values.
    }
}
*/

bool MedianFilterGPU(BMP &image, BMP &result_image) {
    //Cuda error and image values.
    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
    cudaEventRecord(start);

    int height = image.TellHeight();
    int width = image.TellWidth();

    medianFilterKernel(image, result_image, width, height);

    cudaEventRecord(stop);
    cudaEventSynchronize(stop);
    float time = 0;
    cudaEventElapsedTime(&time, start, stop);
    return true;
}
