# matlab的GUi

1. 数据的传递,两种方式:

+ 在结构体handles中新建字段a,并保存变量a的值

```matlab
handles.a=a;
guidata(hObject,handles);
```

 + userdate

   



### 画坐标轴

```matlab
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
a=str2num(get(hObject,'String')); 
if isempty(a)					%判断是否为空
    set(hObject,'String','10')
end
guidate(hObject,handles);		%跟新数据,传递hObject
```

绘图按钮:

```matlab
function pushbutton1_Callback(hObject, eventdata, handles)
f=str2num(get(handles.edit1,'String'));	%获取频率
angle=str2num(get(handles.edit2,'String'));
amp=str2num(get(handles.edit3,'String'));
t=0:1/300:1;							%长度为1
plot(t,amp*sin(2*pi*f*t+angle));
```

清除按钮:

```matlab
function pushbutton2_Callback(hObject, eventdata, handles)
h=gca;							%获取当前坐标轴
cla(h);							%清除
set(handles.edit1,'String','10');%恢复默认值
set(handles.edit2,'String','0');
set(handles.edit3,'String','1');
```

### 快捷菜单

[快捷菜单](https://github.com/morestydy/Guide_matlab_exercise/tree/master/快捷菜单)

在gui布局放置一个坐标轴axes,添加菜单按钮,添加快捷菜单(contex menu),并修改UIContextMenu属性为AxesMenu

![1589703726293](E:%5Cmatlab%5Cexercise%5C1589703726293.png)

![1589703762827](E:%5Cmatlab%5Cexercise%5C1589703762827.png)

### 综合例子

[综合例子](https://github.com/morestydy/Guide_matlab_exercise/tree/master/综合例子)

```matlab

```

![1589705260298](E:%5Cmatlab%5Cexercise%5C1589705260298.png)

# matlab image

> ​    （3）MATLAB基础教学视频（赠送）：该文件夹收录了清华大学出版社出版的《MATLAB应用大全》一书的配套教学视频，免费提供给读者作为参考。

1. 图像类型
   + RGB(0~255)
   + 索引图像
   + 灰度图像
   + 二值图像(0黑色,1白色)

![图像转换函数](E:%5Cmatlab%5Cexercise%5CScreenshot_2020-05-17-17-56-39-430_com.miui.video.png)

[将彩色图像转换成灰度图像](https://github.com/morestydy/Guide_matlab_exercise/blob/image/image/image1.m)

![image-20200517194758648](E:%5Cmatlab%5Cexercise%5Cimage-20200517194758648.png)

[rgb转gray](https://github.com/morestydy/Guide_matlab_exercise/blob/image/image/r2g.m)

![image-20200517195311570](E:%5Cmatlab%5Cexercise%5Cimage-20200517195311570.png)



## 图像基本运算

由于图像类型为unit8,矩阵运算须将图像类型转换成double类型.函数`im2double()`

1. 加法`K=imadd(I,J,'uint16');`

[加](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/add.m)

![image-20200518101131260](E:%5Cmatlab%5Cexercise%5Cimage-20200518101131260.png)

2. 减法`K=imsubtract(I,60);`图像变暗

[减法](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/sub.m)

![image-20200518101543283](E:%5Cmatlab%5Cexercise%5Cimage-20200518101543283.png)

3. 乘法`K=immultiply(I,0.5);`系数小会变暗

[乘法](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/multi.m)

![image-20200518101927707](E:%5Cmatlab%5Cexercise%5Cimage-20200518101927707.png)

4. 比较`K=imabsdiff(I,J);`

[比较](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/diff.m)

![image-20200518103304434](E:%5Cmatlab%5Cexercise%5Cimage-20200518103304434.png)

```matlab
clear all;
close all;
I=imread('cameraman.tif');
subplot(131);
imshow(I);
J=uint8(filter2(fspecial('gaussian'),I));%滤波
subplot(132);
imshow(J,[]);
K=imabsdiff(I,J);
subplot(133);
imshow(K,[]);%图像类型为uint8时,需要加一个[],否则图像不清晰
```

5. 直方图`![image-20200518105044972](E:%5Cmatlab%5Cexercise%5Cimage-20200518105044972.png)`

> `imhist(I)`:绘制灰度图像的直方图
>
> `imhist(I,n)`:指定灰度级的数目为n
>
> `imhist(X,map)`:绘制索引图象的直方图

![image-20200518105234334](E:%5Cmatlab%5Cexercise%5Cimage-20200518105234334.png)

6. 直方图均衡化`J=histeq(I);`

![image-20200518110954669](E:%5Cmatlab%5Cexercise%5Cimage-20200518110954669.png)

7. 图像的插值

   - `imresize()`:采用插值的方法改变图像的大小`[X,map]=imread('trees.tif');
     [Y,nmap]=imresize(X,map,0.5);`

   - `imrotate()`:图象的旋转

     `B=imrotate(A,-20,'nearest');`按照顺时针旋转20度
   
   [https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/%E5%9B%BE%E5%83%8F%E7%9A%84%E5%9F%BA%E6%9C%AC%E8%BF%90%E7%AE%97/rotate.m](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/rotate.m)

![image-20200518112930836](E:%5Cmatlab%5Cexercise%5Cimage-20200518112930836.png)

8. 图像添加噪声`imnoise()`

```matlab
J=imnoise(I,type);
```

给图像添加类型type的噪声

> type:
>
> + 'gaussian' 高斯白噪声
> + 'localvar' 0均值白噪声
> + 'poisson' 泊松噪声
> + 'salt & pepper' 椒盐噪声
> + 'speckle' 乘性噪声

`J=imnoise(I,type,paramenters)` 对噪声type属性进行设置

![image-20200518114345408](E:%5Cmatlab%5Cexercise%5Cimage-20200518114345408.png)

9. 图像的剪切`imcrop()`,获取图像的一部分

`I2 = imcrop(I,[40 40 120 150]);`剪切区域:横坐标40,纵坐标40,大小120*150

10. 图像的傅里叶变换



```matlab
J=fft2(I,256,256);          %傅里叶变换
K=ifft2(J,256,256);         %傅里叶反变换
```

10. 获取图像像素值`impixel()`

[https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/%E5%9B%BE%E5%83%8F%E7%9A%84%E5%9F%BA%E6%9C%AC%E8%BF%90%E7%AE%97/pixe.m](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/pixe.m)

10. 像素值的统计

    [pixelinfo.m](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/pixelinfo.m)

    + `impixelinfo()`:获取图像中任意点的像素值
    + `imcontour()`:绘制灰度图像的等高线

![image-20200518154723866](E:%5Cmatlab%5Cexercise%5Cimage-20200518154723866.png)

imcontour统计,绘制等高线

![image-20200518155109648](E:%5Cmatlab%5Cexercise%5Cimage-20200518155109648.png)

12. 滤波

[滤波](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/图像的基本运算/lvbo.m)

中值滤波:邻域内像素按照灰度值进行排序,取中间的值作为该点的像素值,能很好保护图像边缘

![image-20200518160046863](E:%5Cmatlab%5Cexercise%5Cimage-20200518160046863.png)

![image-20200518161824007](E:%5Cmatlab%5Cexercise%5Cimage-20200518161824007.png)

13. 图像边缘检测: `edge()`函数
[边缘](https://github.com/morestydy/Guide_matlab_exercise/blob/improcess/%E5%9B%BE%E5%83%8F%E7%9A%84%E5%9F%BA%E6%9C%AC%E8%BF%90%E7%AE%97/edg.m)

常用算子Sobel,Prewitt,...
