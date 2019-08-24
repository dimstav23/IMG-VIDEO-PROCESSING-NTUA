I = imread('flowers.tif');
d_Y = linspace(0.1, 1.1, 20);
k_Y = linspace(2, 20, 20);
q = linspace(0.2, 16, 20);
% Oi times twn aktinwn dY kai kY gia tis maskes einai gramikos xwros 20
% simeiwn sto zitoumeno euros
% Gia kathe zeygos oi times twn SNR kai 1/CR apothikeuontai stous antisoixous
% pinakes pou exoun parakatw oristei gia thn telikh apeikonish sou sto
% diagramma
%Se kathe sunarthsh efarmosthke dct2 kai stis periptwseis ton blocks me th
%voitheia ths blkproc(matrix,[],fun,parameter)
%Sthn periptwsh ths kvantishs diairesame me tous antisoixous pinakes
%kvantishs stoixeio pros stoixeio kai sto idct quant pollaplasiasame 
%me autous pali stoixeio pros stoixeio kai efarmosame ta
%antisoixa normalizations(/255,*255)dinontas sthn blkproc parametro tis
%quant kai iquant antistoixa
%Sthn periptwsh ths zigzag dwsame apla san parametero sthn blkproc thn
%sunarthsh zigzag.
%h blkpro xrhsimopoieitai gia katallhlo paddarismo kai epektash ton blocks
%gia apofugh block effect
for k = 1:20
        [Ym, Cbm, Crm] = dct_global(I, d_Y(k), d_Y(k)/2);
        [glob(2,k),cr1] = idct_global(Ym, Cbm, Crm,I);
        glob(1,k) = 1/cr1;
        [Ym, Cbm, Crm] = dct_block(I, k_Y(k), k_Y(k)/2);
        [zig(2,k),cr2] = idct_zigzag(Ym, Cbm, Crm,I);
        zig(1,k) = 1/cr2;
        [Ym, Cbm, Crm] = dct_quant(I, q(k));
        [quant(2,k),cr3] = idct_quant(Ym, Cbm, Crm,I,q(k));
        quant(1,k) = 1/cr3;
end;
% taksinomisi ws pros to ?
[Y,I]=sort(glob(1,:));
B=glob(:,I);
figure();
hold on;
% Apeikonisi se koino diagramma SNR - ? twn grafikwn
% 1. apo tin efarmogi tou global dct me kokkino xrwma
plot(B(1,:),B(2,:),'r');
B=0;I=0;
[Y,I]=sort(zig(1,:));
B=zig(:,I);
% 2. apo tin efarmogi tou block dct(zigzag) me prasino xrwma
plot(B(1,:),B(2,:),'g');
B =0;I=0;
[Y,I]=sort(quant(1,:));
B=quant(:,I);
%3. apo tin efarmogi tou block dct(quantize) me mple xrwma
plot(B(1,:),B(2,:),'b');
title('Snr to 1/CR plot diagram for various mask sizes');
xlabel('1/CR (inverse compression ratio)');
ylabel('SNR');
% Prosthiki upomnimatos
legend('Global DCT', 'Block DCT(zigzag)', 'Block DCT(quantize)','Location', 'SouthEast');
hold off;