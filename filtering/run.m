% Katharismos prohgoumenwn metavlhtwn kai diagrammatwn
clear all; close all;

% Diavasma Eikonas kai Scaling
Image = imread('cat.jpg');
Image = double(Image)/255;

% Efarmorgi filtrwn 
%biliteral kai median
J1 = bilateral(Image, 4,55);
J2 = medfilt2(Image, [5 5]);
figure(1);
imshow(Image);
title('Original image');
figure(2);
imshow(J1);
title('Image processed by biliteral filter with parameters s_d = 5, s_r = 55');
figure(3);
imshow(J2);
title('Image processed by median filter');

s_d = linspace(1, 10, 3);
s_r = linspace(10, 100, 3);

figure(4);
for i = 1:3
    for j = 1:3
        J1 = bilateral(Image, round(s_d(i)), round(s_r(j)));
        subplot(4, 4, (i-1)*4 + j);
        imshow(J1);
    end
end
suptitle('Image processed by biliteral filter for various parameters');

med = linspace(3, 20, 6);

figure(5);
for i = 1:6
    k = round(med(i));
    J2 = medfilt2(Image, [k k]);
    subplot(3, 2, i);
    imshow(J2);
end
suptitle('Image processed by median filter for various parameters');
%Diavasma allhs eikonas gia nea apeikonish
%efarmoghs kai epidrashs biliteral
Image1 = imread('cat2.jpg');
Image1 = double(Image1)/255;
Image1 = bilateral(Image1, 5,40);
figure(6);
imshow(Image1);
Image2 = imread('sample.jpg');
%Image2 = rgb2gray(Image2);
Image2 = double(Image2)/255;
Image2= bilateral(Image2, 5,40);
figure(7);
imshow(Image2);