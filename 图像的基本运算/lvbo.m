clear all;
close all;
I=imread('rice.png');
I=imnoise(I,'salt & pepper',0.03);%��������
J=medfilt2(I,[3 3]);            %��ֵ�˲�
figure;
subplot(321);
imshow(I);
title('��������');
subplot(322);
imshow(uint8(J),[]);
title('��ֵ�˲�');

K=imnoise(I,'Gaussian',0,0.02); %��˹����
h=[1 1 1;1 1 1;1 1 1];
h=h/9;
M=conv2(J,h);
subplot(323);
imshow(K);
title('��˹����');
subplot(324);
imshow(uint8(M),[]);
title('�˲�');

%%����Ӧ�˲�
A=imread('eight.tif');
A=imnoise(A,'Gaussian',0,0.01);
B=wiener2(A,[5 5]);
subplot(325);
imshow(A);
title('��˹����');
subplot(326);
imshow(uint8(B),[]);
title('����Ӧ�˲�');