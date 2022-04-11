function [] = DES()

S.fh = figure('units','pixels',...
              'position',[70 200 400,400],...
              'menubar','none',...
              'numbertitle','off',...
              'name','Encryption',...
              'resize','off');
          
global edit1 edit2 edit3 pass1 pass2 data_encrypt
global irt endrt ert iprt pt


%%%%%%%%%%------%%%%%%%%%%
text2 = uicontrol('style','text',...
        'position',[30 230 150 25],'BackgroundColor',[0.80 0.80 0.80],'string','enter input','FontSize',10);
   
    text5= uicontrol('style','text',...
        'position',[30 250 150 25],'BackgroundColor',[0.80 0.80 0.80],'string','or','FontSize',10);
  push1 = uicontrol('Style','pushbutton',...
        'position',[80 280 50 25],'String','browse','FontSize',10,'CallBack',{@file,S});
    
 
    
edit1 = uicontrol('style','edit',...
        'position',[30 80 160 150],'BackgroundColor',[1 1 1],'string','','Max',2,'FontSize',10);

%%%%%%%%%%--------%%%%%%%%%%
text3 = uicontrol('style','text',...
        'position',[220 230 150 25],'BackgroundColor',[0.80 0.80 0.80],'string','encrypted data','FontSize',10);
edit2 = uicontrol('style','edit',...
        'position',[220 80 160 150],'BackgroundColor',[1 1 1],'string','','Max',2,'FontSize',10);
    
    
    

%%%%%%%%%%--------%%%%%%%%%%




%%%%%%%%%%--------------%%%%%%%%%%
fram1 = uicontrol(gcf,'Style','frame',...
       'position',[70 15 210 50],'BackgroundColor',[0.80 0.80 0.80]);
text5 = uicontrol('style','text',...
        'position',[140 55 60 20],'BackgroundColor',[0.80 0.80 0.80],'string','encrypt key','FontSize',10);

    
pass1 = uicontrol('style','edit',...
        'position',[168 30 60 20],'BackgroundColor',[1 1 1],'string','','FontSize',10);
push1 = uicontrol(gcf,'Style','pushbutton',...
        'position',[233 22.5 40 35],'String','ok','FontSize',10,'CallBack','encrypt();');
    
    
    
    function [] = file(varargin)
        global edit1
       S = varargin{3}
   [filename1 pathname1]=uigetfile({'*.txt'},'Browse')

fullpathname=strcat(pathname1,filename1)
text=fileread(fullpathname)
set(edit1,'string',text)



    

