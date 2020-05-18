clear all;
close all;
I=imread('pout.tif');
subplot(121);
imshow(I);
subplot(122);
imhist(I);
set(gcf,'position',[200 200 600 300]);