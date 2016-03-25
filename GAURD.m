function varargout = GAURD(varargin)
% GAURD MATLAB code for GAURD.fig
%      GAURD, by itself, creates a new GAURD or raises the existing
%      singleton*.
%
%      H = GAURD returns the handle to a new GAURD or the handle to
%      the existing singleton*.
%
%      GAURD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAURD.M with the given input arguments.
%
%      GAURD('Property','Value',...) creates a new GAURD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GAURD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GAURD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GAURD

% Last Modified by GUIDE v2.5 26-Oct-2015 06:23:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GAURD_OpeningFcn, ...
                   'gui_OutputFcn',  @GAURD_OutputFcn, ...
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


% --- Executes just before GAURD is made visible.
function GAURD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GAURD (see VARARGIN)

% Choose default command line output for GAURD
handles.output = hObject;

set(handles.text4, 'String', 'Not Yet Initialized');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GAURD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GAURD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


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
f = fopen('sensitivity.txt','r');
sl = fread(f);
set(handles.text9, 'String', sl);
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
