
function [] = dec()
S.fh = figure('units','pixels',...
              'position',[70 200 400,400],...
              'menubar','none',...
              'numbertitle','off',...
              'name','Decryption',...
              'resize','off');



global edit1 edit2 edit3 pass1 pass2 data_encrypt
global irt endrt ert iprt pt


irt = ...                           
       [58 50 42 34 26 18 10 2 ...
        60 52 44 36 28 20 12 4 ...
        62 54 46 38 30 22 14 6 ...
        64 56 48 40 32 24 16 8 ...
        57 49 41 33 25 17  9 1 ...
        59 51 43 35 27 19 11 3 ...
        61 53 45 37 29 21 13 5 ...
        63 55 47 39 31 23 15 7];
endrt = ...                         
       [40 8 48 16 56 24 64 32 ...
        39 7 47 15 55 23 63 31 ...
        38 6 46 14 54 22 62 30 ...
        37 5 45 13 53 21 61 29 ...
        36 4 44 12 52 20 60 28 ...
        35 3 43 11 51 19 59 27 ...
        34 2 42 10 50 18 58 26 ...
        33 1 41  9 49 17 57 25];
ert = ...                           
       [32  1  2  3  4  5  4  5 ...
         6  7  8  9  8  9 10 11 ...
        12 13 12 13 14 15 16 17 ...
        16 17 18 19 20 21 20 21 ...
        22 23 24 25 24 25 26 27 ...
        28 29 28 29 30 31 32 1];
iprt = ...                          
       [57 49 41 33 25 17  9  1 ...
        58 50 42 34 26 18 10  2 ...
        59 51 43 35 27 19 11  3 ...
        60 52 44 36 63 55 47 39 ...
        31 23 15  7 62 54 46 38 ...
        30 22 14  6 61 53 45 37 ...
        29 21 13  5 28 20 12  4];
pt = ...                            
       [16  7 20 21 29 12 28 17 ...
         1 15 23 26  5 18 31 10 ...
         2  8 24 14 32 27  3  9 ...
        19 13 30  6 22 11  4 25];
    
    
    
    push1 = uicontrol('Style','pushbutton',...
        'position',[80 280 200 25],'String','Browse Encrypted Video','FontSize',10,'CallBack',{@file,S});
    
   % text2 = uicontrol('style','pushbutton',...
       % 'position',[30 240 150 25],'String','get hidden data','FontSize',10,'CallBack',{@file1,S});
   
    
        
edit1 = uicontrol('style','edit',...
        'position',[30 80 160 150],'BackgroundColor',[1 1 1],'string','','Max',2,'FontSize',10);
    
    text3 = uicontrol('style','text',...
        'position',[220 240 150 25],'BackgroundColor',[0.80 0.80 0.80],'string','decrypted data','FontSize',10);
    


edit2 = uicontrol('style','edit',...
        'position',[220 80 160 150],'BackgroundColor',[1 1 1],'string','','Max',2,'FontSize',10);
    
    
    fram1 = uicontrol(gcf,'Style','frame',...
       'position',[70 15 210 50],'BackgroundColor',[0.80 0.80 0.80]);
   
   
   text5 = uicontrol('style','text',...
        'position',[140 55 70 20],'BackgroundColor',[0.80 0.80 0.80],'string','decrypt key','FontSize',10);


    
pass1 = uicontrol('style','edit',...
        'position',[168 30 60 20],'BackgroundColor',[1 1 1],'string','','FontSize',10);
    
    
    
    push1 = uicontrol(gcf,'Style','pushbutton',...
        'position',[233 22.5 40 35],'String','ok','FontSize',10,'CallBack','decrypt();');
    


   
    function [] = file(varargin)
  [filename1 pathname1]=uigetfile({'*.avi';},'select video')
fullpathname1=[pathname1,filename1];
vid=VideoReader(fullpathname1);
   numFrames = vid.NumberOfFrames;
n=numFrames;
for i = 1:n
    frames = read(vid,i);
    imwrite(frames,['Image' int2str(i), '.jpg']);
end;
 
   
    c = imread('C:\Users\User\Documents\MATLAB\New folder\Image1.jpg');
    message=load('input.txt')
   message=char(message)% = 'I am good'
   % message = strtrim(message);
     m = length(message) * 8;
     AsciiCode = uint8(message); 
     binaryString=m
    binaryString = transpose(dec2bin(AsciiCode,8));
    binaryString = binaryString(:);
    N = length(binaryString);
    b = zeros(N,1); %b is a vector of bits
    for k = 1:N
        if(binaryString(k) == '1')
            b(k) = 1;
        else
            b(k) = 0;
        end
    end
     s = c;
    height = size(c,1);
    width = size(c,2);
    k = 1;
    for i = 1 : height
        for j = 1 : width
             LSB = mod(double(c(i,j)), 2);
            if (k>m || LSB == b(k))
                s(i,j) = c(i,j);
                else
                    s(i,j) = c(i,j) + b(k);
            k = k + 1;
        end
        end
    end
     imwrite(s, 'hi.bmp');
    
   
     %%Retriever coding
    
    
     s = imread('hi.bmp');
    
    height = size(s,1);     
    width = size(s,2);
    
    %For this example the max size is 100 bytes, or 800 bits, (bytes * = bits
   
         for i = 1 : height
        for j = 1 : width
            if (k <= m)
                b(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end
    binaryVector = b;
    binValues = [ 128 64 32 16 8 4 2 1 ];
    binaryVector = binaryVector(:);
    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end
    binMatrix = reshape(binaryVector,8,[]);
    display(binMatrix);
    textString = char(binValues*binMatrix);    
       disp(textString);
       implay('video.avi')
           global edit1
       m=char(load('input1.txt'));
       set(edit1,'string',m)
   
 
     
   
   %function [] = file1(varargin)
    %   global edit1
   %m=char(load('input1.txt'));
 %set(edit1,'string',m)
   
 
 
 
 
 
 

