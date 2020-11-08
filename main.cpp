#include <iostream>
#include "EasyBMP/EasyBMP.h"
#include <vector>
#include <algorithm>

using namespace std;

const int iterations = 2;
const int offset = 2;

void MedianFilter(BMP &image, BMP &result_image);

int main() {
    BMP original_image, result_image;

    original_image.ReadFromFile("../original.bmp");
    result_image.ReadFromFile("../original.bmp");

    for (int i = 0; i < iterations; i++)
        MedianFilter(original_image, result_image);

    result_image.WriteToFile("../result.bmp");

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
