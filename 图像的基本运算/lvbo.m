clear all;
close all;
I=imread('rice.png');
I=imnoise(I,'salt & pepper',0.03);%椒盐噪声
J=medfilt2(I,[3 3]);            %中值滤波
figure;
subplot(221);
imshow(I);
title('椒盐噪声');
subplot(222);
imshow(uint8(J),[]);
title('中值滤波');

K=imnoise(I,'Gaussian',0,0.02); %高斯噪声
h=[1 1 1;1 1 1;1 1 1];
h=h/9;
M=conv2(J,h);
subplot(223);
imshow(K);
title('高斯噪声');
subplot(224);
imshow(uint8(M),[]);
title('滤波');
