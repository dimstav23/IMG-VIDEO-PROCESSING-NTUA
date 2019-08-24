function [f_vx, f_vy, obj] = bm_obj(Z, J, b, d)
    dx = d(1); dy = d(2);
    I = Z;
    [dim1, dim2, c] = size(I);
    Z = zeros(dim1+2*dy, dim2+2*dx, c);
    Z((1:dim1)+dy, (1:dim2)+dx, :) = I; % zero padding
    [vx, vy] = bm_1(Z, J, b, d); % motion estimation
    f_vx = medfilt2(vx);
    f_vy = medfilt2(vy);
    obj = f_vx.^2 + f_vy.^2;
    maxVal = max(obj(:));
    maxVal = maxVal / 2;
    [rows, cols] = size(obj);
    for i = 1:rows
        for j = 1:cols
            if obj(i,j) > maxVal
                obj(i,j) = 1;
            else obj(i,j) = 0;
            end
        end
    end
    obj = expand(obj, b);
end