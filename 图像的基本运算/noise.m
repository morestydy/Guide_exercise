clear all;
close all;
I=imread('eight.tif');
J1=imnoise(I,'gaussian',0.1);
J2=imnoise(I,'poisson');
J3=imnoise(I,'salt & pepper',0.1);
figure;
subplot(221),imshow(I),title('ԭͼ')
subplot(222),imshow(J1),title('��˹')
subplot(223),imshow(J2),title('����')
subplot(224),imshow(J3),title('����')