function varargout = VIDEOGUI(varargin)
% VIDEOGUI MATLAB code for VIDEOGUI.fig
%      VIDEOGUI, by itself, creates a new VIDEOGUI or raises the existing
%      singleton*.
%
%      H = VIDEOGUI returns the handle to a new VIDEOGUI or the handle to
%      the existing singleton*.
%
%      VIDEOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VIDEOGUI.M with the given input arguments.
%
%      VIDEOGUI('Property','Value',...) creates a new VIDEOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before VIDEOGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to VIDEOGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help VIDEOGUI

% Last Modified by GUIDE v2.5 02-Dec-2019 01:49:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @VIDEOGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @VIDEOGUI_OutputFcn, ...
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

end
% --- Executes just before VIDEOGUI is made visible.
function VIDEOGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to VIDEOGUI (see VARARGIN)

% Choose default command line output for VIDEOGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes VIDEOGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = VIDEOGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
frame1=imread('C:\Users\Ahmad Aijaz\Desktop\CV final\frame1.jpg');
axes(handles.axes1);
imshow(frame1);


end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
frame2=imread('C:\Users\Ahmad Aijaz\Desktop\CV final\frame131.jpg');
axes(handles.axes2);
imshow(frame2);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
figure;
vidObj = VideoReader('C:\Users\Ahmad Aijaz\Desktop\a.mp4');
 vidObj.CurrentTime = 0;
  currAxes = axes;
  while hasFrame(vidObj)
      vidFrame = readFrame(vidObj);
       image(vidFrame, 'Parent', currAxes);
       currAxes.Visible = 'off';
       pause(1/vidObj.FrameRate);
  end

% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)

 frame1=imread('C:\Users\Ahmad Aijaz\Desktop\CV final\frame1.jpg');
 frame2=imread('C:\Users\Ahmad Aijaz\Desktop\CV final\frame131.jpg');
 
frame1_grey=rgb2gray(frame1);
 [r,c]=size(frame1_grey);
 temp1=white_background(frame1_grey,r,c);
 
  temp2=black_background(temp1,r,c);
  temp3=coverttowhite(temp2,r,c);
  d1=v_coa(temp3,r,c); 
  %------------------------------
 frame2_grey=rgb2gray(frame2);
 [r1,c1]=size(frame2_grey);
 temp4=white_background(frame2_grey,r1,c1);
  temp5=black_background(temp4,r1,c1);
  temp6=coverttowhite(temp5,r1,c1);
  d2=v_coa(temp6,r1,c1);
  time=131/27;
  temp_val=(d2-d1)*(d2-d1);
  final_distance=sqrt(temp_val);
  %final_distance=final_distance/3779;
  final_distance=final_distance*(0.0002645);
  speed=final_distance/time;
  set(handles.speed,'String',speed);
  display (speed);

% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end



function I=black_background(I,r,c)
for i=1:r
     for j=1:c
         if I(i,j)==140
             I(i,j)=0;
         end
     end
 end
end

function I=white_background(I,r,c)
for i=1:r
     for j=1:c
         if I(i,j)<140
             I(i,j)=255;
         end
     end
 end
end

function I=coverttowhite(I,r,c)
for i=1:r
    for j=1:c
        if I(i,j)>140
            I(i,j)=255;
        end
    end
end
end
function a=aarea(I,r,c)
a=0;
for i=1:r
    for j=1:c
    if I(i,j)==255
        a=a+1;
    end
    end
end
end

function c2= v_coa(I,r,c)
c2=0;
for i=1:r
    for j=1:c
        if I(i,j)==255
            c2=c2+j;
        end
    end
end
a=aarea(I,r,c);
c2=c2/a;
end


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end



function speed_Callback(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of speed as text
%        str2double(get(hObject,'String')) returns contents of speed as a double


% --- Executes during object creation, after setting all properties.
end
function speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
