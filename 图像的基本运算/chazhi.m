clear all;
close all;
%%% ͼ���С
[X,map]=imread('trees.tif');
[Y,nmap]=imresize(X,map,0.5);
subplot(121);
subimage(X,map);
subplot(122);
subimage(Y,nmap);
