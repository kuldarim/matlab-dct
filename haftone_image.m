% Tiesiogine DCT transformacija
% 1. Vaizdas M x N sudalinamas i 8x8 arba 16x16 blokus;
% 2. Kiekvienas vaizdo blokas lyginamas su kiekviena is baziniu funkciju
% (8x8=64 blokai);
% 3. I koeficientu matrica 8x8 blokai i atitinkama kiekvieno bloko vieta
% rasomas koeficientas, parodantis kiekvieno vaizdo bloko atititikimo lygi
% duotai bazinei funkcijai. Bloku uzpildymas vykdomas zig-zag tvarka.
% Rezultate turime DCT koeficientu matrica, kur kiekvieno bloko dydis yra
% M/8 x N/8. Didesnis koeficientas atspindi didesni atitikima.

% Atvirkstine DCT transformacija
% 1. Is koeficientu matricos imamas kiekvienas koeficientas is DCT bloko,
% padauginamas is atitinkamos bazines funkcijos.
% Sandaugu suma atstato viena is 8x8 paveiksliuko bloka.
clc, clear all, close all

I = imread('cameraman.tif');
Halftone = im2uint8(floydHalftone(I));

I_DCT = dct2(I);
Halftone_DCT = dct2(Halftone);

figure
subplot(1,2,1)
imshow(I)
title('original')
subplot(1,2,2)
imshow(Halftone)
title('halftone')

figure
subplot(2,3,1)
imshow(uint8(abs(I_DCT))), colormap(jet(64)), colorbar
title('original')

subplot(2,3,2)
imshow(log(abs(I_DCT)),[]), colormap(jet(64)), colorbar
title('original')

subplot(2,3,3)
mesh(abs(I_DCT))
title('original')

subplot(2,3,4)
imshow(uint8(abs(Halftone_DCT))), colormap(jet(64)), colorbar
title('halftone')

subplot(2,3,5)
imshow(log(abs(Halftone_DCT)),[]), colormap(jet(64)), colorbar
title('halftone')

subplot(2,3,6)
mesh(abs(Halftone_DCT))
title('halftone')