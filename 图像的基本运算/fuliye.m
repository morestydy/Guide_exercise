clear all;
close all;
I=imread('cameraman.tif');
J=fft2(I,256,256);          %傅里叶变换
K=ifft2(J,256,256);         %傅里叶反变换
figure;
subplot(1,3,1),imshow(I)
subplot(1,3,2),imshow(log(abs(J)),[])
subplot(1,3,3),imshow(K,[])
