clear all
close all
clc

%Read Image
I = imread('koala.jpg');

%Separate Pixels
Red=I(:,:,1);
Green=I(:,:,2);
Blue=I(:,:,3);

%Sigmas
Sigma_D = 1; %Distance
Sigma_B = 1; %Brightness

%Grid
S = 3;
[X,Y] = meshgrid(-S:S,-S:S);

%The weights
Weight_Filter=exp(-(X.^2+Y.^2)/(2*Sigma_D^2));

%Find Size of Image
[Height, Width, ~] = size(image);

%Go through the whole image
for i = 1:Height
    for j = 1:Width
        
        %Move the grid
        imin=max(i-S,1);
        iMAX=min(i+S,Height);
        jmin=max(j-S,1);
        jMAX=min(j+S,Width);
        Pic=I(imin:iMAX,jmin:jMAX);
        
        %Calculate the Intensity Filter
        Range_Filter = exp(-(I-image(i,j)).^2/(2*Sigma_B^2));.
    end
end















for i=1:r
    for j=1:c
        %Adjusting the window size
        imin=max(i-w,1);
        iMAX=min(i+w,r);
        jmin=max(j-w,1);
        jMAX=min(j+w,c);
        I=image(imin:iMAX,jmin:jMAX);
        
        % Range filter
        range_filter=exp(-(I-image(i,j)).^2/(2*sigma_r^2));
        
        %Taking the product of the range and domain filter.The combination is refered to as Bilateral Filter
        BilateralFilter=range_filter.*domain_filter((imin:iMAX)-i+w+1,(jmin:jMAX)-j+w+1);
        
        Fnorm=sum(BilateralFilter(:));
        
        %normalize the output
        output(i,j)=sum(sum(BilateralFilter.*I))/Fnorm;
    end
end