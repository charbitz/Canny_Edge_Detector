# Canny Edge Detector Implementation

This repository contains the final project for the **Digital Image Processing** course, completed during the 8th semester at EECE, DUTh. The project focuses on the **implementation of Canny's Edge Detector** from scratch, with a comparison to MATLAB's built-in Canny Edge Detector to evaluate performance.

## Project Overview

The primary goal of this project was to implement Canny's Edge Detection algorithm manually and compare its results to those produced by MATLAB's preloaded library for Canny Edge Detection.

## Files Explanation

### Code Files:
- **`code.m`**: The main script that contains the overall pipeline for the project, including the comparison with MATLAB's built-in Canny Edge Detector.
- **`my_canny.m`**: The script implementing Canny's Edge Detection from scratch.
- **`matlab_canny.m`**: The script using MATLAB's Canny Edge Detection library for comparison purposes.

### Image Files:
- **`Images/`**: A directory containing the images used for testing the edge detection algorithms.
- **`results/`**: A directory containing screenshots of the edge detection results for each test image.

## Image Results

### Input Image

| Input Image |
|-------------|
| ![Input Image](https://github.com/charbitz/Canny_Edge_Detector/blob/master/Images/emogi.jpg) |

### My Canny Filter Results

| My Canny Filter Results |
|-------------------------|
| ![My Canny Filter Results](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/filters%20results.png) |

### Comparison of the Two Detectors

| Comparison of My Canny and MATLAB's Canny |
|-------------------------------------------|
| ![Comparison](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/results%20comparison.png) |

### Pixel Difference Between the Two Results

| Difference in Pixels |
|----------------------|
| ![Pixel Difference](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/diffs.png) |

## Measurements

- **Total number of common pixels**: 50,325
- **Number of white pixels**: 8,345
- **Number of black pixels**: 41,980
- **Percentage of matching**: 83.42%