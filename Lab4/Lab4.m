clear all
close all
clc

A = imread('Im__15.png');
B = imread('Im__16.png');

[Height, Width] = size(A);

GxA = double(A);
GyA = double(A);
GxB = double(B);
GyB = double(B);

for i = 2:Height
    for j = 2:Width
        GxA(i,j) = GxA(i,j) - GxA(i-1,j);
        GyA(i,j) = GyA(i,j) - GyA(i,j-1);
        GxB(i,j) = GxB(i,j) - GxB(i-1,j);
        GyB(i,j) = GyB(i,j) - GyB(i,j-1);
    end
end

GA = GxA + GyA;
GB = GxB + GyB;