function varargout = HW05(varargin)
% HW05 MATLAB code for HW05.fig
%      HW05, by itself, creates a new HW05 or raises the existing
%      singleton*.
%
%      H = HW05 returns the handle to a new HW05 or the handle to
%      the existing singleton*.
%
%      HW05('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HW05.M with the given input arguments.
%
%      HW05('Property','Value',...) creates a new HW05 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HW05_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HW05_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HW05

% Last Modified by GUIDE v2.5 03-Dec-2017 13:01:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @HW05_OpeningFcn, ...
    'gui_OutputFcn',  @HW05_OutputFcn, ...
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


% --- Executes just before HW05 is made visible.
function HW05_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HW05 (see VARARGIN)

% Choose default command line output for HW05
handles.output = hObject;
set(handles.axes1,'xtick',[],'ytick',[])
set(handles.axes2,'xtick',[],'ytick',[])
set(handles.axes3,'xtick',[],'ytick',[])
set(handles.axes4,'xtick',[],'ytick',[])
set(handles.axes5,'xtick',[],'ytick',[])
set(handles.axes6,'xtick',[],'ytick',[])
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HW05 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HW05_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[Name path] = uigetfile({'*.*'},'Select Your Image');
Image = imread([path Name]);
handles.img = Image;
guidata(hObject, handles);
axes(handles.axes1)
imshow(Image);
set(handles.pushbutton2 , 'Enable' , 'On');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

Image = handles.img;

Filter = get(handles.uibuttongroup2 , 'SelectedObject');
Filter = get(Filter,'TooltipString');
Variance = str2num(get(handles.edit1,'String'));

[ Gaussian_Filter , Blur_Image , Miss_Image ] = Gaussian_Fliter( Image  , Variance  , Filter );
handles.bimage = Blur_Image;
handles.mimage = Miss_Image;
guidata(hObject, handles);

axes(handles.axes2)
imshow(Blur_Image)

axes(handles.axes3)
imshow(Miss_Image)

axes(handles.axes4)
mesh(Gaussian_Filter)

axes(handles.axes5)
imshow(Gaussian_Filter)
set(handles.uipanel7 , 'Visible' , 'On')
set(handles.pushbutton4 , 'Visible' , 'On')


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)



% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
Mode  = get(handles.checkbox1 , 'Value');
if Mode == 1
    set(handles.edit5,'Visible','On')
    set(handles.text12,'Visible','On')
    set(handles.edit3,'Visible','Off')
    set(handles.edit4,'Visible','Off')
    set(handles.text10,'Visible','Off')
    set(handles.text11,'Visible','Off')
else
    set(handles.edit5,'Visible','Off')
    set(handles.text12,'Visible','Off')
    set(handles.edit3,'Visible','On')
    set(handles.edit4,'Visible','On')
    set(handles.text10,'Visible','On')
    set(handles.text11,'Visible','On')
    
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
implay('Myfigure.avi',15);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
Mode  = get(handles.checkbox1 , 'Value');

if Mode == 1
    writerObj = VideoWriter('./Myfigure.avi');
    writerObj.FrameRate = 30;
    open(writerObj);
    handle = figure;
    
    num = str2num( get(handles.edit5,'String'));
    scale = linspace(1/8 , 1 , num);
    for i=num:-1:1
        resizeimage1 = ones(size(handles.bimage));
        resizeimage = Resize(handles.bimage ,[] , [scale(i) , scale(i)]);
        resizeimage1(1:size(resizeimage,1),1:size(resizeimage,2)) = resizeimage;
        imshow(resizeimage1)
        frame = getframe(handle);
        writeVideo(writerObj,frame);
        imwrite(resizeimage , ['out' num2str(i) '.jpg']);
    end
    handle.Name = 'test';
    close test
    close(writerObj)
    set(handles.pushbutton4 , 'Enable' , 'On');
    
    
else
    if ~isempty(get(handles.edit3,'String')) && ~isempty(get(handles.edit4,'String'))
        resizeimage1 = ones(size(handles.bimage));
        New_Size = [str2num(get(handles.edit3,'String')) , str2num(get(handles.edit4,'String'))];
          resizeimage = Resize(handles.bimage ,New_Size, []);
        handel=figure;
        handel.Name = 'test';
        imshow(resizeimage);
        pause(5);
        close test
    end
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Variance = str2num(get(handles.edit6,'String'));
[ ~ , Blur_Image_L , ~ ] = Gaussian_Fliter( handles.imgc1  , Variance , 'Low' );
[ ~ , Blur_Image_H , ~ ] = Gaussian_Fliter( handles.imgc2  , Variance , 'High' );
imagef = fft2(Blur_Image_L) +  fft2(Blur_Image_L);
image = ifft2(imagef);
image = mat2gray(image);
image = mat2gray(image);
imwrite(image , 'out.jpg');
axes(handles.axes6)

imshow(image);


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
[NameC pathC] = uigetfile({'*.*'},'Select Your Image');
ImageC = imread([pathC NameC]);
handles.imgc1 = ImageC;
guidata(hObject, handles);

% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[NameC pathC] = uigetfile({'*.*'},'Select Your Image');
ImageC = imread([pathC NameC]);
handles.imgc2 = ImageC;
guidata(hObject, handles);


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

missf = fftshift(fft2(double( handles.mimage))); 
figure
imshow(missf);


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure
imshow(handles.bimage);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
figure
imshow(handles.mimage);
