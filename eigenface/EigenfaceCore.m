function [m, A, Eigenfaces] = EigenfaceCore(T)

m = mean(T,2); % Computing the average face image m = (1/P)*sum(Tj's)    (j = 1 : P)
Train_Number = size(T,2);

A = [];  
for i = 1 : Train_Number
    temp = double(T(:,i)) - m; % Computing the difference image for each image in the training set Ai = Ti - m
    A = [A temp]; % Merging all centered images
end


L = A'*A; 
[V ,D] = eig(L); 
L_eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec V(:,i)];
    end
end

Eigenfaces = A * L_eig_vec; % A: centered image vectors