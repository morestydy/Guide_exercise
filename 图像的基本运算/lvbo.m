clear all;
close all;
I=imread('rice.png');
I=imnoise(I,'salt & pepper',0.03);%��������
J=medfilt2(I,[3 3]);            %��ֵ�˲�
figure;
subplot(221);
imshow(I);
title('��������');
subplot(222);
imshow(uint8(J),[]);
title('��ֵ�˲�');

K=imnoise(I,'Gaussian',0,0.02); %��˹����
h=[1 1 1;1 1 1;1 1 1];
h=h/9;
M=conv2(J,h);
subplot(223);
imshow(K);
title('��˹����');
subplot(224);
imshow(uint8(M),[]);
title('�˲�');
