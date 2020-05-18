clear all;
close all;
I = imread('football.jpg');
I2 = imcrop(I,[40 40 120 150]);
figure; 
subplot(1,2,1),imshow(I)
subplot(1,2,2), imshow(I2)
