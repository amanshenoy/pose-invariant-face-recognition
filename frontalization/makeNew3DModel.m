function model3D = makeNew3DModel(A, U, xy)

model3D.refU = U;
model3D.outA = A;
model3D.ref_XY = xy;
model3D.render_width = size(U,2);
model3D.render_height = size(U,1);
model3D.sizeU = [size(U,1),size(U,2)];

ind = sub2ind([size(U,1), size(U,2)], round(xy(:,2)), round(xy(:,1)));
threedee = zeros(numel(ind),3);
tmp = U(:,:,1);
threedee(:,1) = tmp(ind);
tmp = U(:,:,2);
threedee(:,2) = tmp(ind);
tmp = U(:,:,3);
threedee(:,3) = tmp(ind);

indbad = find(max(threedee,[],2)==0);
threedee(indbad,:)=[];


model3D.indbad = indbad;
model3D.threedee = threedee;








