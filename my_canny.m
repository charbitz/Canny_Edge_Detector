function [ I_mine ] = my_canny( image )

% Grayscale and double :
image_gs=rgb2gray(image);
image_gs=double(image_gs);

% Blurring Procedure using Gaussian Filter :
kernel = fspecial('gaussian', [21 21], 1.6);
I_blurred = imfilter(image_gs, kernel);

% Using Sobel Operators-Masks :
x_mask = [-1, 0, 1; -2, 0, 2; -1, 0, 1];
y_mask = [1, 2, 1; 0, 0, 0; -1, -2, -1];

% Creating x and y directions :
x_dir=conv2(I_blurred, x_mask,'same');
y_dir=conv2(I_blurred, y_mask,'same');

% Creating Magnitude and Theta of the gradient
magn=sqrt(x_dir.^2 + y_dir.^2);
theta=atan2(y_dir , x_dir);
theta=theta*180/pi;

% Ready for Non-maximum Suppression Procedure :
lines=size(I_blurred,1);
cols=size(I_blurred,2);

%Adjustment for negative angles, making all angles positive :
for i=1:lines
    for j=1:cols
        if (theta(i,j)<0) 
            theta(i,j)=360+theta(i,j);
        end;
    end;
end;

theta_new=zeros(lines, cols);

%Adjusting angles to nearest 0, 45, 90, or 135 degree :
for i=1:lines
    for j=1:cols
        if ((theta(i,j) >= 0 ) && (theta(i,j) < 22.5) || (theta(i,j) >= 157.5) && (theta(i,j) < 202.5) || (theta(i,j) >= 337.5) && (theta(i,j) <= 360))
            theta_new(i,j) = 0;
        elseif ((theta(i,j) >= 22.5) && (theta(i,j) < 67.5) || (theta(i,j) >= 202.5) && (theta(i,j) < 247.5))
            theta_new(i,j) = 45;
        elseif ((theta(i,j) >= 67.5 && theta(i,j) < 112.5) || (theta(i,j) >= 247.5 && theta(i,j) < 292.5))
            theta_new(i,j) = 90;
        elseif ((theta(i,j) >= 112.5 && theta(i,j) < 157.5) || (theta(i,j) >= 292.5 && theta(i,j) < 337.5))
            theta_new(i,j) = 135;
        end;
    end;
end;

% BW searches for edges :
BW = zeros(lines,cols);

%Non-Maximum Supression :
for i=2:lines-1
    for j=2:cols-1
        if (theta_new(i,j)==0)
            BW(i,j) = (magn(i,j) == max([magn(i,j), magn(i,j+1), magn(i,j-1)]));
        elseif (theta_new(i,j)==45)
            BW(i,j) = (magn(i,j) == max([magn(i,j), magn(i+1,j-1), magn(i-1,j+1)]));
        elseif (theta_new(i,j)==90)
            BW(i,j) = (magn(i,j) == max([magn(i,j), magn(i+1,j), magn(i-1,j)]));
        elseif (theta_new(i,j)==135)
            BW(i,j) = (magn(i,j) == max([magn(i,j), magn(i+1,j+1), magn(i-1,j-1)]));
        end;
    end;
end;

% BW takes magnitude value of each pixel :
BW = BW.*magn;

% Hysteresis Thresholding Procedure :

%Values for Thresholding
% T_Low = 0.075;
% T_High = 0.175; 

%   for : Lenna.jpg  ,forest.jpg , emogi.jpg
  T_Low = 0.075;
  T_High = 0.175; 

%   for : grass_sky.jpg , greek_flag.jpg
% T_Low = 0.0085;
% T_High = 0.025;

%   for : sea_waves.jpg , wood.jpg
%   T_Low = 0.0325;
%   T_High = 0.08755;

T_Low = T_Low * max(max(BW));
T_High = T_High * max(max(BW));
% I_ht is the image with (0s and 1s after hysterisis thresholding) :
I_ht = zeros(lines,cols);

for i=1:lines
    for j=1:cols
        if (BW(i,j) < T_Low)
            I_ht(i,j) = 0;
        elseif (BW(i,j) > T_High)
            I_ht(i,j) = 1;
% check if neighbour pixels are in an edge point :
        elseif ( BW(i+1,j)>T_High || BW(i-1,j)>T_High || BW(i,j+1)>T_High || BW(i,j-1)>T_High || BW(i-1, j-1)>T_High || BW(i-1, j+1)>T_High || BW(i+1, j+1)>T_High || BW(i+1, j-1)>T_High)
            I_ht(i,j) = 1;
        end;
    end;
end;

% Convert I_ht to final Image I_mine 
% with white spots at the edge points (value:255) :
% I_mine = uint8(T_res.*255);
I_mine = I_ht.*255;
% Show images all together :
figure,
subplot(2,3,1);
image_gs=uint8(image_gs);
imshow(image_gs);
title('Grayscale Image :');

subplot(2,3,2);
I_blurred=uint8(I_blurred);
imshow(I_blurred)
title('Gaussian Filter :');

subplot(2,3,3);
imshow(x_dir);
title('X direction Sobel :');

subplot(2,3,4);
imshow(y_dir);
title('Y direction Sobel :');

subplot(2,3,5);
% Important to show magnitude :
imshow(uint8(magn));
title('Magnitude of Sobel Operator :');

subplot(2,3,6);
% Important to show theta :
imshow(uint8(theta))
title('Theta of Sobel Operator :');

% Show final image with initial image in te same figure :
figure,
subplot(1,2,1);
imshow(image);
title('Initial Image :');
subplot(1,2,2);
imshow(uint8(I_mine));
title('my canny Final Image :');

end

