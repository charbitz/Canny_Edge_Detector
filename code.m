clear all;
close all;
clc;

% Reading image :
image = imread('Images/Lenna.jpg');
figure,
imshow(image);
title('Initial Image :');
% call my_canny() :
[ I_mine ] = my_canny( image );
% call matlab_canny() :
[ I_mtlb ] = matlab_canny( image );

% Now show both final images(my canny and matlab's) in the same figure :
figure,
subplot(1,2,1);
imshow(uint8(I_mine));
title('my canny :');
subplot(1,2,2);
imshow(uint8(I_mtlb));
title('Matlab´s canny :');

% Comparing . . . :

% Checking how similar the two images-results are :
fprintf('Comparing the two final Images ...\n');

fprintf('\n');

% Comparing via printing the differences on a third figure-image :
fprintf('Printing the differences :\n');
figure,
I_show_diff=imshowpair(I_mine,I_mtlb);
title('Differences with colors :');
fprintf('Differences printed with imshowpair()! \n');

fprintf('\n');

fprintf('Find Differences with a 3rd image I_diff :\n');
% Getting points of difference :
I_diff=abs(I_mine-I_mtlb);
% 0 means same value (both 0 or both 255) so it's a black pixel,
% 255 means different values (0 and 255) so it's a white pixel.
figure,
imshow(uint8(I_diff));
title('Image with differences :');

% Getting total num of image pixels :
num_pixels=size(I_diff,1)*size(I_diff,2);
fprintf('Number of total pixels: %d \n',num_pixels);

% Find nonzero elements in points_diff in other words find number of white pixels:
num_points_diff = nnz(I_diff);
% so matching elements will be all the rest :
num_points_match = num_pixels - num_points_diff;
fprintf('Number of white pixels: %d \n',num_points_diff);
fprintf('Number of black pixels: %d \n',num_points_match);

% Percent of failure :
perc_fail = 100 * (num_points_diff/num_pixels);
% Percent of matching :
perc_match = 100 * (num_points_match/num_pixels);
fprintf('Percentage of failure : %0.4f \n',perc_fail);
fprintf('Percentage of matching : %0.4f \n',perc_match);

fprintf('\n');