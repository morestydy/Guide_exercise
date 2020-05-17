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

