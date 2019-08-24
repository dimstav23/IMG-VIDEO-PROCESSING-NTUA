function J = bilateral (I, sigma_d, sigma_r)
    %parameters defining
    k = 6*sigma_d;
    sigma_r = sigma_r/100;
    k1 = round(k/2);
    I1 = padarray(I,[k1 k1]);

    G = fspecial('gaussian', k, sigma_d);
    [S1, S2] = size(I);
    
    Output=zeros(S1+k1,S2+k1);
    for i = k1:(S1+k1)
        for j = k1:(S2+k1)
            Frame = I1(i-k1+1:i+k1 , j-k1+1:j+k1); 
            F = Frame-I1(i,j);
            F = exp(-(F.*F)/(2*sigma_r*sigma_r));
            FOGfilter = F.*G;
            biliteral2 = Frame.*FOGfilter;
            Output(i,j) = sum(sum(biliteral2))/sum(sum(FOGfilter));   
        end;
    end
    Output = Output(k1+1:S1+k1,k1+1:S2+k1);
    J = Output;
end