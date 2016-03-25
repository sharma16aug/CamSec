function varargout = camsec(varargin)
% CAMSEC MATLAB code for camsec.fig
%      CAMSEC, by itself, creates a new CAMSEC or raises the existing
%      singleton*.
%
%      H = CAMSEC returns the handle to a new CAMSEC or the handle to
%      the existing singleton*.
%
%      CAMSEC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMSEC.M with the given input arguments.
%
%      CAMSEC('Property','Value',...) creates a new CAMSEC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before camsec_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to camsec_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help camsec

% Last Modified by GUIDE v2.5 26-Oct-2015 06:03:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @camsec_OpeningFcn, ...
                   'gui_OutputFcn',  @camsec_OutputFcn, ...
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


% --- Executes just before camsec is made visible.
function camsec_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to camsec (see VARARGIN)

% Choose default command line output for camsec
handles.output = hObject;
img = imread('camsec.png');
imshow(img);

set(handles.edit2, 'String', ' ');
set(handles.edit1, 'String', ' ');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes camsec wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = camsec_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

e1 = get(hObject,'String');
handles.e1=e1;
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.e1=e1;
e2 = get(hObject,'String');
if strcmp(e1,'admin@123')==1
    if strcmp(e2,'admin_123')==1
        TRAIN
    end
elseif stecmp(e1,'gaurd@123')==1
    if strcmp(e2,'gaurd_123')==1
        GAURD
    end
else
    prompt('Invalid Input');
    set(handles.edit1, 'String', ' ');
    set(handles.edit2, 'String', ' ');
end
    
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
