function [Fb_Y_mask Fb_Cb_mask Fb_Cr_mask] = fft_block(I, r_Y, r_C)
%Bhma 1 
%Metatroph xrwmatikou xwrou

RGB = im2double(I); % initialization
%figure(1),imshow(RGB);
YCbCr = rgb2ycbcr(RGB); % RGB->YCbCr
%figure(2),imshow(YCbCr);
Y=YCbCr(:,:,1); % Y Channel
%figure(3),imshow(Y);
Cb=YCbCr(:,:,2); % Cb Channel
%figure(4),imshow(Cb);
Cr=YCbCr(:,:,3); % Cr Channel
%figure(5),imshow(Cr); 

%Bhma 2 euresh fft kai metatopish fasmatos

Fb_Y = blkproc(Y, [8 8], 'fft2'); %Y channel
Fb_Cb = blkproc(Cb, [8 8], 'fft2'); %Cb channel
Fb_Cr = blkproc(Cr, [8 8], 'fft2'); %Cr channel
sc=0.5;

Fb_Y_log = sc * log10(1 + abs(Fb_Y));
%figure, imshow(Fb_Y_log);%2D block-based FFT-Y channel
Fb_Y = blkproc(Fb_Y,[8 8],'fftshift');% Y channel
Fb_Cb = blkproc(Fb_Cb,[8 8],'fftshift');% Cb channel
Fb_Cr = blkproc(Fb_Cr,[8 8],'fftshift');% Cr channel
Fb_Cr_log = sc * log10(1 + abs(Fb_Cr));
%figure, imshow(Fb_Cr_log)%2D block-based shift FFT of Cr channel 

%Bhma 3
%Apokoph ligotero shmantikwn sunistwswn

m = zeros(8);
[fx,fy] = freqspace([8 8], 'meshgrid'); % mask application
m(sqrt(fx.^2 + fy.^2) < r_Y) = 1; %?????????? ??????
Fb_Y_mask = blkproc(Fb_Y, [8 8], 'times', m); % ???/???? ???????? ?? ???????? ??? ???????
%figure, mesh(fx, fy, m), %3D mask for Y'


[fxCb,fyCr] = freqspace([8 8], 'meshgrid'); % mask application
m(sqrt(fxCb.^2 + fyCr.^2) < r_C) = 1; %?????????? ??????
Fb_Cb_mask = blkproc(Fb_Cb, [8 8], 'times', m); % ???/???? ???????? ?? ???????? ??? ???????
%figure, mesh(fxCb, fyCr, m), %3D mask for Cb'


[fxCr,fyCr] = freqspace([8 8], 'meshgrid'); % mask application
m(sqrt(fxCr.^2 + fyCr.^2) < r_C) = 1; %?????????? ??????
Fb_Cr_mask = blkproc(Fb_Cr, [8 8], 'times', m); % ???/???? ???????? ?? ???????? ??? ???????
%figure, mesh(fxCr, fyCr, m), %3D mask for Cr'


