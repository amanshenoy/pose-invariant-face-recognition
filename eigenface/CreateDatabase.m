function T = CreateDatabase(TrainDatabasePath)

TrainFiles = dir(TrainDatabasePath);
Train_Number = 0;

for i = 1:size(TrainFiles,1)
    if not(strcmp(TrainFiles(i).name,'.')|strcmp(TrainFiles(i).name,'..')|strcmp(TrainFiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1; % Number of all images in the training database
    end
end

T = [];
for i = 1 : Train_Number
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(TrainDatabasePath,str);
    
    img = imread(str);
    img = rgb2gray(img);
    
    [irow, icol] = size(img);
   
    temp = reshape(img',irow*icol,1);   % Reshaping 2D images into 1D image vectors
    T = [T temp]; % 'T' grows after each turn                    
end