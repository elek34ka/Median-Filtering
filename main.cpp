#include "MedianFilter.h"
#include <cuda.h>
using namespace std;
#include "device_launch_parameters.h"
#include <iostream>

#define gpuErrchk(ans) { gpuAssert((ans), __FILE__, __LINE__); }

__global__ void MedianFilter_gpu(BMP &image, BMP &result_image) {

    vector<pair<float, int>> filter;
    vector<RGBApixel> colours;
    vector<pair<int, int>> offset_range;

    for (int i = -offset; i <= offset; i++)
        for (int j = -offset; j <= offset; j++)
            offset_range.emplace_back(i, j);

    for (int i = 0; i < image.TellHeight(); i++) {
        for (int j = 0; j < image.TellWidth(); j++) {
            filter.clear();
            colours.clear();
            for (auto p : offset_range) {
                if (i + p.first < image.TellHeight() && i + p.first >= 0 &&
                    j + p.second >= 0 && j + p.second < image.TellWidth()) {

                    RGBApixel pixel = image.GetPixel(i + p.first, j + p.second);

                    float rgb_value =
                            (float) pixel.Red * 0.11f + (float) pixel.Green * 0.59f + (float) pixel.Blue * 0.3f;

                    filter.emplace_back(rgb_value, (int) filter.size());
                    colours.push_back(pixel);
                }
            }

            sort(filter.begin(), filter.end());

            result_image.SetPixel(i, j, colours[filter[filter.size() / 2].second]);

        }
    }
    result_image.SetBitDepth(32);
}


int main() {
    BMP original_image, result_image_cpu, result_image_gpu;

    original_image.ReadFromFile("../original.bmp");
    result_image_cpu.ReadFromFile("../original.bmp");
    result_image_gpu.ReadFromFile("../original.bmp");

    for (int i = 0; i < iterations; i++) {
        MedianFilter(original_image, result_image_cpu);
        MedianFilter_gpu(original_image, result_image_gpu);
    }

    result_image_cpu.WriteToFile("../result_cpu.bmp");
    result_image_gpu.WriteToFile("../result_gpu.bmp");


}

void MedianFilter(BMP &image, BMP &result_image) {

    vector<pair<float, int>> filter;
    vector<RGBApixel> colours;
    vector<pair<int, int>> offset_range;

    for (int i = -offset; i <= offset; i++)
        for (int j = -offset; j <= offset; j++)
            offset_range.emplace_back(i, j);

    for (int i = 0; i < image.TellHeight(); i++) {
        for (int j = 0; j < image.TellWidth(); j++) {
            filter.clear();
            colours.clear();
            for (auto p : offset_range) {
                if (i + p.first < image.TellHeight() && i + p.first >= 0 &&
                    j + p.second >= 0 && j + p.second < image.TellWidth()) {

                    RGBApixel pixel = image.GetPixel(i + p.first, j + p.second);

                    float rgb_value =
                            (float) pixel.Red * 0.11f + (float) pixel.Green * 0.59f + (float) pixel.Blue * 0.3f;

                    filter.emplace_back(rgb_value, (int) filter.size());
                    colours.push_back(pixel);
                }
            }

            sort(filter.begin(), filter.end());

            result_image.SetPixel(i, j, colours[filter[filter.size() / 2].second]);

        }
    }
    result_image.SetBitDepth(32);
}


