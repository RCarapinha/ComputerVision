clear all
close all
clc
f = imread('IMG.jpg');
J = rgb2gray(f);

%Exercise 1
figure
histogram(J)
figure
hold on
title('Img Without Hist Equalization')
subplot(1,2,1)
imshow(f)
subplot(1,2,2)
imshow(J)
A = histeq(J);
figure
hold on
title('Img With Hist Equalization')
subplot(1,2,1)
imshow(J)
subplot(1,2,2)
imshow(A)

%Exercise 2
figure
imshow(f.*3)

%Exercise 3
figure
subplot(1,2,1)
imshow(imrotate(f,90))
subplot(1,2,2)
imshow(imresize(f,0.1))

%Exercise 4
level = graythresh(J);
BW = imbinarize(J,level);
figure
imshowpair(J,BW,'montage')

%Exercise 5
B = imcrop(f,[400 100 700 200]);
figure
imshow(B)

%Exercise 6
r = xcorr2(J,imcrop(J,[400 100 700 200]));
imagesc(r)
colorbar
surf(r)
shading interp

%Exercise 7
BW1 = edge(J,'sobel');
BW2 = edge(J,'canny');
figure
imshow(BW1)
figure
imshow(BW2)