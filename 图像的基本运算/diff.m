clear all;
close all;
I=imread('cameraman.tif');
subplot(131);
imshow(I);
% J=imread('cameraman.tif');
% subplot(1,3,2);
% imshow(J);

J=uint8(filter2(fspecial('gaussian'),I));%滤波
subplot(132);
imshow(J,[]);
K=imabsdiff(I,J);
subplot(133);
imshow(K,[]);%图像类型为uint8时,需要加一个[],否则图像不清晰
title('效果图')