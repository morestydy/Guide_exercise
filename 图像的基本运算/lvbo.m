clear all;
close all;
I=imread('rice.png');
I=imnoise(I,'salt & pepper',0.03);%椒盐噪声
J=medfilt2(I,[3 3]);            %中值滤波
figure;
subplot(321);
imshow(I);
title('椒盐噪声');
subplot(322);
imshow(uint8(J),[]);
title('中值滤波');

K=imnoise(I,'Gaussian',0,0.02); %高斯噪声
h=[1 1 1;1 1 1;1 1 1];
h=h/9;
M=conv2(J,h);
subplot(323);
imshow(K);
title('高斯噪声');
subplot(324);
imshow(uint8(M),[]);
title('滤波');

%%自适应滤波
A=imread('eight.tif');
A=imnoise(A,'Gaussian',0,0.01);
B=wiener2(A,[5 5]);
subplot(325);
imshow(A);
title('高斯噪声');
subplot(326);
imshow(uint8(B),[]);
title('自适应滤波');