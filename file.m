
    
function file(source,eventdata)
  

%x=get(object_handle.edit1,'string')
%setappdata(0,'x',x)
[filename1 pathname1]=uigetfile({'*.txt'},'Browse')

fullpathname=strcat(pathname1,filename1)
text=fileread(fullpathname)



    
    
