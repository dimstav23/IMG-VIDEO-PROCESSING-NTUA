function [E,Z,M] = gdlog(I,s)
   % Ypologismos M
   K = 31; vk = (0:K-1)-(K-1)/2; [u,v] = meshgrid(vk,vk);
   G = 1 / (2*pi*s^2) * exp(-(u.^2+v.^2) / (2*s^2));
   Gu = -(u/s^2) .* G; Gv = -(v/s^2) .* G;
   Gx = imfilter(I, Gu, 'replicate', 'conv');
   Gy = imfilter(I, Gv, 'replicate', 'conv');
   M = sqrt(Gx.^2 + Gy.^2);
   
   % Ypologismos Z
   L = fspecial('log', 31, s);
   Gm = imfilter(I, L, 'replicate');
   Z = im2bw(Gm, 0);
   Z = bwperim(Z);
   
   % Ypologismos E
   E = Z.*M;
end