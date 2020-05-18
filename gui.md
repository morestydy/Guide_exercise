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

