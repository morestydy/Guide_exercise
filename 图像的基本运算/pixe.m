close all;
clear all;
RGB=imread('trees.tif');
figure;
imshow(RGB);
r=[10 20 30 50];
c=[30 50 70 85];
p=impixel(RGB,r,c)