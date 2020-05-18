clear all;
close all;
I = imread('circuit.tif');
I2 = imcrop(I,[60 40 100 90]);
figure, 
subplot(1,2,1),imshow(I)
subplot(1,2,2), imshow(I2)
