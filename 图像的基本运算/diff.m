clear all;
close all;
I=imread('cameraman.tif');
subplot(131);
imshow(I);
% J=imread('cameraman.tif');
% subplot(1,3,2);
% imshow(J);

J=uint8(filter2(fspecial('gaussian'),I));%�˲�
subplot(132);
imshow(J,[]);
K=imabsdiff(I,J);
subplot(133);
imshow(K,[]);%ͼ������Ϊuint8ʱ,��Ҫ��һ��[],����ͼ������
title('Ч��ͼ')