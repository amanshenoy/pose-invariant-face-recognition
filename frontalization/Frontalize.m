function [frontal_sym, frontal_raw] = Frontalize(C_Q, I_Q, refU, eyemask)                                         

    ACC_CONST = 800; 
    I_Q = double(I_Q);
     
    bgind = sum(abs(refU),3)==0;
   

    threedee = reshape(refU,[],3)';
    tmp_proj = C_Q * [threedee;ones(1,size(threedee,2))];
    tmp_proj2 = tmp_proj(1:2,:)./ repmat(tmp_proj(3,:),2,1);
    
    
    bad = min(tmp_proj2)<1 | tmp_proj2(2,:)>size(I_Q,1) | tmp_proj2(1,:)>size(I_Q,2) | bgind(:)';
    tmp_proj2(:,bad) = [];

    ind = sub2ind([size(I_Q,1),size(I_Q,2)], round(tmp_proj2(2,:)),round(tmp_proj2(1,:)));
    
    synth_frontal_acc = zeros(size(refU,1),size(refU,2));
    
    ind_frontal = 1:(size(refU,1)*size(refU,2));
    ind_frontal(bad) = [];
    
    
    [c,~,ic] = unique(ind);
    count = hist(ind,c);
    synth_frontal_acc(ind_frontal) = count(ic);

   
    synth_frontal_acc(bgind) = 0;
   
    synth_frontal_acc = imfilter(synth_frontal_acc,fspecial('gaussian', 16, 30),'same','replicate');
   
     
   
    c1 = I_Q(:,:,1); f1 = zeros(size(synth_frontal_acc));
    c2 = I_Q(:,:,2); f2 = zeros(size(synth_frontal_acc));
    c3 = I_Q(:,:,3); f3 = zeros(size(synth_frontal_acc));
    
    f1(ind_frontal) = interp2(c1, tmp_proj2(1,:), tmp_proj2(2,:), 'cubic'); 
    f2(ind_frontal) = interp2(c2, tmp_proj2(1,:), tmp_proj2(2,:), 'cubic'); 
    f3(ind_frontal) = interp2(c3, tmp_proj2(1,:), tmp_proj2(2,:), 'cubic'); 
   
    frontal_raw = cat(3,f1,f2,f3);
    
    midcolumn = round(size(refU,2)/2);
    sumaccs = sum(synth_frontal_acc);
    sum_left = sum(sumaccs(1:midcolumn));
    sum_right = sum(sumaccs(midcolumn+1:end));
    sum_diff = sum_left - sum_right;
    
    if abs(sum_diff)>ACC_CONST 
        if sum_diff > ACC_CONST 
            weights = [zeros(size(refU,1),midcolumn), ones(size(refU,1),midcolumn)];
        else 
            weights = [ones(size(refU,1),midcolumn), zeros(size(refU,1),midcolumn)];
        end
        weights = imfilter(weights, fspecial('gaussian', 33, 60.5),'same','replicate');
       
       
        synth_frontal_acc = synth_frontal_acc./max(synth_frontal_acc(:));
        weight_take_from_org = 1./exp(0.5+synth_frontal_acc);%
        weight_take_from_sym = 1-weight_take_from_org;
        
        weight_take_from_org = weight_take_from_org.*fliplr(weights);
        weight_take_from_sym = weight_take_from_sym.*fliplr(weights);
        
        weight_take_from_org = repmat(weight_take_from_org,[1,1,3]);
        weight_take_from_sym = repmat(weight_take_from_sym,[1,1,3]);
        weights = repmat(weights,[1,1,3]);
        
        denominator = weights + weight_take_from_org + weight_take_from_sym;
        frontal_sym = (frontal_raw.*weights + frontal_raw.*weight_take_from_org + flipdim(frontal_raw,2).*weight_take_from_sym)./denominator;
        
             
        frontal_sym = frontal_sym.*(1-eyemask) + frontal_raw.*eyemask;
        

    else 
        frontal_sym = uint8(frontal_raw);
    end
    frontal_raw = uint8(frontal_raw);
    frontal_sym = uint8(frontal_sym);

  
end