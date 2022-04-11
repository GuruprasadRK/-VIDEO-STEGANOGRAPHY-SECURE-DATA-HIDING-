function dehiding=dehiding()


   

vid=VideoReader('C:\Users\User\Documents\MATLAB\New folder\Original.mp4');
numFrames = vid.NumberOfFrames;
n=numFrames;
for i = 1:n
    frames = read(vid,i);
    imwrite(frames,['Image' int2str(i), '.jpg']);
end;
 
    x=imshow('C:\Users\User\Documents\MATLAB\New folder\Image1.jpg');
    c = imread('C:\Users\User\Documents\MATLAB\New folder\Image1.jpg');
    message=load('input.txt');
   message=char(message);% = 'I am good'
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
     imshow('hi.bmp');
   
     %%Retriever coding
    z=imshow('hi.bmp');
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
  
     disp(textString)
    
    %%frames to video
     writerObj=VideoWriter('C:\Users\User\Documents\MATLAB\New folder\video.avi');
     writerObj.FrameRate=80;
     open(writerObj)
    for i=1:numFrames
         frame=sprintf('Image%d.jpg',i);
         input=imread(frame);
         writeVideo(writerObj,input);
   
    end
  
     
      close(writerObj);

