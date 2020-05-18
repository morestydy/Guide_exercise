close all;
clear all;
imshow('football.jpg');
RGB=imread('football.jpg');
h=impixelinfo;
set(h,'position',[200 320 330 20]);
I=rgb2gray(RGB);
figure;
imcontour(I);           %绘制等高线
set(gcf,'position',[200 200 400 350]);