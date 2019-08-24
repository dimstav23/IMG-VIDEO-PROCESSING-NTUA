%Ta figures 1..9 einai gia diafores times tou s(parameter) kai treshold=0
%Ta figures 10..18 einai gia diafores times tou s(parameter) kai
%threshold=0.7 s={3,1.5,0.1}
%Ta tria teleutaia plots aforoun th methodo Canny
%h Laplacian methodos xrhsimopoiei th deuterh paragwgo enw h Canny thn
%prwth.Ta apotelesmata efarmosthkan sthn eikona buildings.tif gia na mhn
%ginetai makroskelhs o kwdikas omoia epakrivws kai gia thn peppers.tif
%Mia kaluterh methodos gia thn epilogh katwfliou tha htan an pairname gia
%daifores times katwfliou auth me to mikrotero platos laplacian to opoio
%tha einai pio konta kai sto zero crossing.
%Parathroume oti me tis diafores allages parametrwn kai me thn Canny alla
%kai me thn allh methodo oti oso auksanoume tis parametrous kratiountai pio
%entones olo kai ligoteres akmes(kratiountai aisthita oi pio shmantikes akmes)
%enw oso mikrainei kratiountia kai pio ashmnates akmes alla den kratiountai
%toso entona oi shmantikes akmes.
%O kwdikas pou afora metavoles twn parametrwn paratithetai parakatww kai
%gia allagh tou threshold apla sth sunarthsh gdlog mporei na prostethei
% mia parametros threshold kai douleuei kateutheian.(by default 0)
I = im2double(imread('building.tif'));

[E, Z, M] = gdlog(I, 3);

figure(1); grayshow(Z);
title('With the given method for parameterer 3 and threshold 0(Z)')

figure(2); grayshow(M);
title('With the given method for parameterer 3 and threshold 0(M)')

figure(3); grayshow(E);
title('With the given method for parameterer 3 and threshold 0(E)')
%{
clear vars E Z M
[E, Z, M] = gdlog(I, 1.5,0);

figure(4); grayshow(Z);
title('With the given method for parameterer 1.5 and threshold 0(Z)')

figure(5); grayshow(M);
title('With the given method for parameterer 1.5 and threshold 0(M)')

figure(6); grayshow(E);
title('With the given method for parameterer 1.5 and threshold 0(E)')

clear vars E Z M

[E, Z, M] = gdlog(I, 0.1,0);

figure(7); grayshow(Z);
title('With the given method for parameterer 0.1and threshold 0(Z)')

figure(8); grayshow(M);
title('With the given method for parameterer 0.1and threshold 0(M)')

figure(9); grayshow(E);
title('With the given method for parameterer 0.1 and threshold 0(E)')
clear vars E Z M
[E, Z, M] = gdlog(I, 3,0.2);

figure(10); grayshow(Z);
title('With the given method for parameterer 3 and threshold 0.2(Z)')

figure(11); grayshow(M);
title('With the given method for parameterer 3 and threshold 0.2(M)')

figure(12); grayshow(E);
title('With the given method for parameterer 3 and threshold 0.2(E)')
clear vars E Z M
[E, Z, M] = gdlog(I, 1.5,0.2);

figure(13); grayshow(Z);
title('With the given method for parameterer 1.5 and threshold 0.2(Z)')

figure(14); grayshow(M);
title('With the given method for parameterer 1.5 and threshold 0.2(M)')

figure(15); grayshow(E);
title('With the given method for parameterer 1.5 and threshold 0.2(E)')

clear vars E Z M

[E, Z, M] = gdlog(I, 0.1,0.2);

figure(16); grayshow(Z);
title('With the given method for parameterer 0.1 and threshold 0.2(Z)')

figure(17); grayshow(M);
title('With the given method for parameterer 0.1 and threshold 0.2(M)')

figure(18); grayshow(E);
title('With the given method for parameterer 0.1 and threshold 0.2(E)')

figure, imshow(~edge(I, 'canny', [], 1))
figure, imshow(~edge(I, 'canny', [], 2))
figure, imshow(~edge(I, 'canny', [], 4))
%gia thn peppers
clear all close all
I = im2double(imread('peppers.tif'));

[E, Z, M] = gdlog(I, 3, 0);

figure(1); grayshow(Z);
title('With the given method for parameterer 3 and threshold 0(Z)')

figure(2); grayshow(M);
title('With the given method for parameterer 3 and threshold 0(M)')

figure(3); grayshow(E);
title('With the given method for parameterer 3 and threshold 0(E)')
clear vars E Z M
[E, Z, M] = gdlog(I, 1.5,0);

figure(4); grayshow(Z);
title('With the given method for parameterer 1.5 and threshold 0(Z)')

figure(5); grayshow(M);
title('With the given method for parameterer 1.5 and threshold 0(M)')

figure(6); grayshow(E);
title('With the given method for parameterer 1.5 and threshold 0(E)')

clear vars E Z M

[E, Z, M] = gdlog(I, 0.1,0);

figure(7); grayshow(Z);
title('With the given method for parameterer 0.1and threshold 0(Z)')

figure(8); grayshow(M);
title('With the given method for parameterer 0.1and threshold 0(M)')

figure(9); grayshow(E);
title('With the given method for parameterer 0.1 and threshold 0(E)')
clear vars E Z M
[E, Z, M] = gdlog(I, 3,0.2);

figure(10); grayshow(Z);
title('With the given method for parameterer 3 and threshold 0.2(Z)')

figure(11); grayshow(M);
title('With the given method for parameterer 3 and threshold 0.2(M)')

figure(12); grayshow(E);
title('With the given method for parameterer 3 and threshold 0.2(E)')
clear vars E Z M
[E, Z, M] = gdlog(I, 1.5,0.2);

figure(13); grayshow(Z);
title('With the given method for parameterer 1.5 and threshold 0.2(Z)')

figure(14); grayshow(M);
title('With the given method for parameterer 1.5 and threshold 0.2(M)')

figure(15); grayshow(E);
title('With the given method for parameterer 1.5 and threshold 0.2(E)')

clear vars E Z M

[E, Z, M] = gdlog(I, 0.1,0.2);

figure(16); grayshow(Z);
title('With the given method for parameterer 0.1 and threshold 0.2(Z)')

figure(17); grayshow(M);
title('With the given method for parameterer 0.1 and threshold 0.2(M)')

figure(18); grayshow(E);
title('With the given method for parameterer 0.1 and threshold 0.2(E)')

figure, imshow(~edge(I, 'canny', [], 1))
figure, imshow(~edge(I, 'canny', [], 2))
figure, imshow(~edge(I, 'canny', [], 4))
%}