
clear all
clc
close all


prompt = {'Enter test image name (a number between 1 to 10):'};
dlg_title = 'Input of PCA-Based Face Recognition System';
num_lines= 1;
def = {'1'};

TrainDatabasePath = 'C:\Users\USER\Desktop\Multi-Task Pose-Invariant Face Recognition\PCA_based Face Recognition System\TrainDatabase';
TestDatabasePath = 'C:\Users\USER\Desktop\Multi-Task Pose-Invariant Face Recognition\PCA_based Face Recognition System\TestDatabase';


TestImage = strcat(TestDatabasePath,'\',char('2'),'.jpg');
im = imread(TestImage);

T = CreateDatabase(TrainDatabasePath);
[m, A, Eigenfaces] = EigenfaceCore(T);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(TrainDatabasePath,'\',OutputName);
SelectedImage = imread(SelectedImage);

imshow(im)
title('Test Image');
figure,imshow(SelectedImage);
title('Matched Image');

str = strcat('Matched image is :  ',OutputName);
disp(str)
