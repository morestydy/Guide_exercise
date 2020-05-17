clear all;
close all;
RGB=imread('peppers.png','png');
I=rgb2gray(RGB);
figure;
imshow(RGB);
figure;
imshow(I);
set(gcf,'position',[200,200,300,300]);