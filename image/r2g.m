clear all;
close all;
[X,map]=imread('trees.tif');%X��������ɫֵ,map��ɫ��
I=rgb2gray(map);
figure;
imshow('trees.tif');
figure;
imshow(X,I);
set(gcf,'position',[200,200,300,300]);