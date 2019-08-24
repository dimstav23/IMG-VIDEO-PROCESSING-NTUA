I = imread('flowers.tif');
sizeI = 362*500*3;          % ginomeno diastasewn arxikis eikonas
RGB = im2double(I);         % lipsi RGB parametrwn
figure(1); 
imshow(I);                  % apeikonisi arxikis eikonas prin tin sumpiesi
title('Original Image');

% A. Sympiesi eikonas me efarmogi fft se oli tin eikona
[Ym, Cbm, Crm] = fft_global(I, 0.8, 0.4);   % Lipsi eksodou apo maskes
iRGB = ifft_global(Ym, Cbm, Crm);           % Euresi twn parametrwn RGB pou antistoixoun stis eksodous twn maskwn
figure(2);
imshow(iRGB);                               % apeikonisi eikonas meta apo auti tin sumpiesi
title('Compressed image using fft');
snrGlobal = snr(RGB, RGB-iRGB)              % ypologismos snr
lGlobal = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI % ypologismos inverse compression ratio

% B. Sympiesi eikonas me efarmogi fft se block tis eikona
[Ym, Cbm, Crm] = fft_block(I, 0.8, 0.4);    % Lipsi eksodou apo maskes
iRGB = ifft_block(Ym, Cbm, Crm);            % Euresi twn parametrwn RGB pou antistoixoun stis eksodous twn maskwn
figure(3);
imshow(iRGB);                               % apeikonisi eikonas meta apo auti tin sumpiesi
title('Compressed image using fft in blocks');
snrBlock = snr(RGB, RGB-iRGB)               % ypologismos snr
lBlock = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI  % ypologismos ë

% C. Lipsi timwn gia sxediasi grafikis SNR - ë
rY = linspace(0.1, 1, 20);
rC = linspace(0.2, 0.8, 20);
% Oi times twn aktinwn rY kai rC gia tis maskes einai gramikos xwros 50
% simeiwn sto zitoumeno euros
% Gia kathe zeygos oi times twn SNR kai ë apothikeuontai ston pinaka glob
% kai block, gia ton prwto kai ton deutero tropo sumpiesis antistoixa.
k = 1;
for j = 1:20
        [Ym, Cbm, Crm] = fft_global(I, rY(j), rC(j));
        iRGB = ifft_global(Ym, Cbm, Crm);
        glob(1,k) = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI;
        glob(2,k) = snr(RGB, RGB-iRGB);
        [Ym, Cbm, Crm] = fft_block(I, rY(j), rC(j));
        iRGB = ifft_block(Ym, Cbm, Crm);
        block(1,k) = (nnz(Ym)+nnz(Cbm)+nnz(Crm))/sizeI;
        block(2,k) = snr(RGB, RGB-iRGB);
        k = k + 1;
end;
% taksinomisi ws pros to ë
%[Y,I]=sort(glob(1,:));
% diathrwntas stin idia stili to snr poy antistoixei stis times p
% xrisimopoiithikan gia ton ypologismo toy ë.
%B=glob(:,I);
figure(4);
hold on;
% Apeikonisi se koino diagramma SNR - ë twn grafikwn
% 1. apo tin efarmogi tou global fft me kuano xrwma
plot(glob(1,:),glob(2,:),'b');
%[Y,I]=sort(block(1,:));
%B=block(:,I);
% 2. apo tin efarmogi tou block fft me kitrino xrwma
plot(block(1,:),block(2,:),'r');
title('SNR to inverse compression rate diagram changing rY,rC');
xlabel('inverse compression rate');
ylabel('SNR');
% Prosthiki upomnimatos
legend('Using global fft', 'Using block fft','Location', 'SouthEast');
hold off;