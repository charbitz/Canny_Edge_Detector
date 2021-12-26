function [ I_mtlb ] = matlab_canny( image )

% Apply Canny's Edge Detection Method with Matlab's ready function(edge):
image_gs_mtlb=rgb2gray(image);

I_mtlb = edge(image_gs_mtlb,'Canny');
I_mtlb=255*I_mtlb;
% I_mtlb=uint8(I_mtlb);

% Show final image(edge function) with initial image :
figure,
subplot(1,2,1);
imshow(image);
title('Initial Image :');
subplot(1,2,2);
imshow(uint8(I_mtlb));
title('Matlab´s Final Image :');
end

