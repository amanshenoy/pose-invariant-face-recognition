
addpath calib


I_Q = imread('test.jpg');


load eyemask eyemask 
load DataAlign2LFWa REFSZ REFTFORM 


detector = 'ZhuRamanan'; 
fidu_XY = [];
facial_feature_detection;
[C_Q, ~,~,~] = estimateCamera(Model3D, fidu_XY);
[frontal_sym, frontal_raw] = Frontalize(C_Q, I_Q, Model3D.refU, eyemask);
frontal_sym = imtransform(frontal_sym,REFTFORM,'XData',[1 REFSZ(2)], 'YData',[1 REFSZ(1)]);
frontal_raw = imtransform(frontal_raw,REFTFORM,'XData',[1 REFSZ(2)], 'YData',[1 REFSZ(1)]);
figure; imshow(I_Q); title('Query photo');
figure; imshow(I_Q); hold on; plot(fidu_XY(:,1),fidu_XY(:,2),'.'); hold off; title('Query photo with detections overlaid');
figure; imshow(imcrop(frontal_raw,[250/4+20,250/4,250/2-40,250/2])); title('Frontalilzed no symmetry');
figure; imshow(imcrop(frontal_sym,[250/4+20,250/4,250/2-40,250/2])); title('Frontalilzed with soft symmetry');



