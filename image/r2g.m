clear all;
close all;
[X,map]=imread('trees.tif');%X是像素颜色值,map是色谱
I=rgb2gray(map);
figure;
imshow('trees.tif');
figure;
imshow(X,I);
set(gcf,'position',[200,200,300,300]);