clear all
close all

digitDatasetPath = uigetdir('C:\Users\Carapinha\OneDrive - Universidade de Aveiro\Wroclaw\Courses\Computer Vision\Lab5','Select Folder with Data');
imds = imageDatastore(digitDatasetPath,'IncludeSubfolders',true,'LabelSource','foldernames');

%Each number has 1000 images
labelCount = countEachLabel(imds)

img = readimage(imds,1);
size(img)

numTrainFiles = 36;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

layers = [
    imageInputLayer([28 28 1])
    
    %1st Convolutional Layer
    convolution2dLayer(3,4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    %----------
    
    %2nd Convolutional Layer
    convolution2dLayer(3,4,'Padding','same')
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',2)
    %----------
    
    fullyConnectedLayer(10)
    softmaxLayer
    classificationLayer];

options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',8, ...
    'Shuffle','every-epoch', ...
    'ValidationData',imdsValidation, ...
    'ValidationFrequency',30, ...
    'Verbose',false, ...
    'Plots','training-progress');

net = trainNetwork(imdsTrain,layers,options);

YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)

%Don't trust completely on elapsed time

%1 - Increase Nr of Epochs
%2 Epochs, 85.88%, 18 sec
%4 Epochs, 90.16%, 31 sec
%6 Epochs, 93.52%, 46 sec

%2 - Increase Layer Size (4 Epochs)
%(4,4), 85.88%, 18 sec
%(8,4), 91.48%, 41 sec
%(4,8), 95.20%, 32 sec
%(8,8), 97.08%, 43 sec

%3 - Add one layer (4 Epochs)
%(4,4,4), 88.36%, 34 sec
%(8,8,8), 96.20%, 46 sec
%(4,4,8), 90.48%, 33 sec
%(4,8,4), 90.32%, 37 sec
%(8,4,4), 88.52%, 45 sec

