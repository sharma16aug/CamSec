function varargout = TRAIN(varargin)
% TRAIN MATLAB code for TRAIN.fig
%      TRAIN, by itself, creates a new TRAIN or raises the existing
%      singleton*.
%
%      H = TRAIN returns the handle to a new TRAIN or the handle to
%      the existing singleton*.
%
%      TRAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRAIN.M with the given input arguments.
%
%      TRAIN('Property','Value',...) creates a new TRAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TRAIN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TRAIN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TRAIN

% Last Modified by GUIDE v2.5 25-Oct-2015 23:28:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TRAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @TRAIN_OutputFcn, ...
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


% --- Executes just before TRAIN is made visible.
function TRAIN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TRAIN (see VARARGIN)

% Choose default command line output for TRAIN
handles.output = hObject;

set(handles.text4, 'String', 'Not Yet Initialized');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TRAIN wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TRAIN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
sl = (get(hObject,'Max') - get(hObject,'Value'))*100;
set(handles.text9, 'String', sl);
f = fopen('sensitivity.txt','w+');
fwrite(f,sl);
handles.sl=sl;
guidata(hObject,handles);
set(handles.text7, 'String',get(hObject,'Value')*100/get(hObject,'Max'));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in initialize.
function initialize_Callback(hObject, eventdata, handles)
% hObject    handle to initialize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=videoinput('winvideo');
i=getsnapshot(a);
imshow(i);
set(handles.text4, 'String', 'Initialized');
set(handles.text1, 'String', ' ');
set(handles.text2, 'String', ' ');
handles.i=i;
guidata(hObject,handles);

% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=videoinput('winvideo');
i=handles.i;
sl=handles.sl;
while get(hObject,'Value');
    set(handles.text4, 'String', 'Recording');
    s=getsnapshot(a);
    imshow(s);
    if max(max(imdivide(i,s)))>sl
        set(handles.text2, 'String', 'warning');
        set(handles.text1, 'String', ' ');
        beep
    else
        set(handles.text1, 'String', 'safe');
        set(handles.text2, 'String', ' ');
    end
end
set(handles.text4, 'String', 'Not Recording');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of record


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
