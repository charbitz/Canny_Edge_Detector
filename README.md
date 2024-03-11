# Description
***This repo contains the final project of the course **Digital Image Processing** of the 8th semester. The purpose of this project was the implementation of Canny's Edge detector.***

In addition, in order to check the performance of this Edge Detector, a matlab preloaded library of Canny Edge detetor was used for comparison.

## Files explanation:

In code files, there are:
* code.m 	 : the main script, in which there is the main pipeline of the project.The comparison with Edge detector of MATLAB was also included.
* my_canny.m 	 : the script, in which there is the implemetation of the Canny Edge Detector.
* matlab_canny.m : the script, in which there is the pipeline for the MATLAB's library for Canny Edge Detection.

In image files, there are:
* Images  : the directory with the testing images.
* results : the directory with some screenshot results for every testing image.

# Image Results


| input image |
|---------|
| ![](https://github.com/charbitz/Canny_Edge_Detector/blob/master/Images/emogi.jpg)   |


|   My Canny filter results  |
|---------|
| ![](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/filters%20results.png)   |



|   Comparison of the two detectors |
|---------|
| ![](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/results%20comparison.png)   |


### Comparing the two results:

|   plotting the difference in pixels |
|---------|
| ![](https://github.com/charbitz/Canny_Edge_Detector/blob/master/results/emoji/diffs.png)   |

#### Measurements:

* Number of total common pixels: 50325
* Number of white pixels: 8345
* Number of black pixels: 41980
* Percentage of matching: 83.4178