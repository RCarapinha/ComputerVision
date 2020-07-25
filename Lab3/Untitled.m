clear all
close all
clc

%1
I = imread('koala.jpg');
J = imnoise(I,'gaussian');
figure(1);
imshow(J);
title('Noisy Image');

%2a - Rectangular
Rect = ones(5,5)*1/25; %Area
figure(2);
imshow(convn(double(J),Rect,'same'));
title('Rectangular Filter')

%2a - Triangular
Tri = tril(ones(5));
figure(3);
imshow(convn(J,Tri,'same'));
title('Triangular Filter')

%2a - Gaussian
figure(4);
imshow(imgaussfilt(J));
title('Gaussian Filter')

%2b
figure(4);
imshow(medfilt3(J));
title('Median Filter');

%2c
figure(5);
imshow(imbilatfilt(J));
title('Bilateral Filter');

%-----------------------------------

%Gaussian Filter
Sigma = [2 2 2; 2 2 2; 2 2 2];
