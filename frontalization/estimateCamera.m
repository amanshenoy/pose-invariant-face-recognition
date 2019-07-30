function [projectionMatrix, est_A,est_R,est_T] = estimateCamera(Model3D, fidu_XY)

    fidu_XY(Model3D.indbad,:) = [];
    
   
    [est_A,est_R,est_T]=doCalib(Model3D.sizeU(1),...
        Model3D.sizeU(2), fidu_XY,Model3D.threedee,...
        Model3D.outA,[],[]);

   
    RT = [est_R est_T'];
    projectionMatrix = est_A * RT;
    
end
