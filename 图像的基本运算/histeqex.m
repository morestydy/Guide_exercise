clear all;
close all;
I=imread('pout.tif');
% subplot(211);
% imshow(I);
% subplot(212);
% imhist(I);
subplot(121);
J=histeq(I);

imhist(J);
subplot(122);
imshow(J);
set(gcf,'Position',[200 200 600 300]);

