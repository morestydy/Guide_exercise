function varargout = untitled6(varargin)
% UNTITLED6 MATLAB code for untitled6.fig
%      UNTITLED6, by itself, creates a new UNTITLED6 or raises the existing
%      singleton*.
%
%      H = UNTITLED6 returns the handle to a new UNTITLED6 or the handle to
%      the existing singleton*.
%
%      UNTITLED6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED6.M with the given input arguments.
%
%      UNTITLED6('Property','Value',...) creates a new UNTITLED6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled6

% Last Modified by GUIDE v2.5 17-May-2020 17:45:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled6_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled6_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled6 is made visible.
function untitled6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled6 (see VARARGIN)

% Choose default command line output for untitled6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.stopbutton,'enable','off');     %��ʼ��,��ͣ������

% --- Outputs from this function are returned to the command line.
function varargout = untitled6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startbutton.
function startbutton_Callback(hObject, eventdata, handles)
% hObject    handle to startbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (~isempty(daqfind))      %��������Ƿ��ڹ���
    stop(daqfind)           %��ͣ����
end
ai = analoginput('winsound');   %Ϊ��������һ��ģ�������豸����
addchannel(ai, [1 2]);          %��������ͨ��2ͨ������Ϊ����������Ϊ˫����
set(ai, 'SampleRate', 8000);    %����Ƶ��8000hz
timePeriod = 0.1;               %ʱ��0.1s
set(ai, 'SamplesPerTrigger', timePeriod*ai.sampleRate);
set(ai, 'TriggerRepeat', 1);
set(ai, 'TriggerType', 'manual');
set(ai, 'TimerPeriod', timePeriod);  
set(ai, 'BufferingConfig',[2048,20]);
start(ai);                      %��ʼ�ɼ�
trigger(ai);                    
d=getdata(ai, ai.SamplesPerTrigger);    %��ȡ��������
hline(1)=plot(handles.axes1,1:size(d,1),d(:,1),'b');    %������
xlim('auto');
hline(2)=plot(handles.axes2,1:size(d,1),d(:,2),'r');    %������
xlim('auto');
handles.ai=ai;                          %�����������
guidata(hObject,handles);
data.ai=ai;
data.handles=handles;
data.hline=hline;
set(ai,'UserData',data);            %ͨ��userdata�������ݴ���
set(handles.startbutton,'enable','off');%������ʼ��ť,������
set(handles.stopbutton,'enable','on');% 
set(data.ai, 'TimerFcn', @updateData);%��ͼ����

% --- Executes on button press in stopbutton.
function stopbutton_Callback(hObject, eventdata, handles)
% hObject    handle to stopbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isfield(handles,'ai')
    if isrunning(handles.ai)
        stop(handles.ai); 
    end
end
set(handles.startbutton,'enable','on');
set(handles.stopbutton,'enable','off');


% --- Executes on button press in exitbutton.
function exitbutton_Callback(hObject, eventdata, handles)
% hObject    handle to exitbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer=questdlg('�����˳�������','Warning!');
switch answer
    case {'No','Cancel'}
        return;
    case 'Yes'
        if isfield(handles,'ai')
            if isvalid(handles.ai)
                if isrunning(handles.ai)
                    stop(handles.ai);
                end
            end
            delete(handles.ai);
            delete(handles.figure1);
        else
            delete(handles.figure1);
        end
end

function updateData(obj,event)
x = peekdata(obj, obj.SamplesPerTrigger);
h=obj.UserData;
set(h.hline(1),'YData', x(:,1));
set(h.hline(2),'YData', x(:,2));
drawnow;
