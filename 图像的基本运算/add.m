clear all;
close all;


I=imread('rice.png');
subplot(1,3,1);
imshow(I);
J=imread('cameraman.tif');
subplot(1,3,2);
imshow(J);
K=imadd(I,J,'uint16');
subplot(1,3,3);
imshow(K,[]);