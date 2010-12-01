function landmarks = setLandmarks(set)

if(set == 1)
    landmarks = [0.1 0.4;
                 0.2 0.6;
                 0.2 0.5
                 0.8 0.5;
                 0.1 0.1;
                 %0.2 0.2;
                 0.55 0.6;
                 0.4 0.65;
                 0.4 0.3;
                 %0.6 0.3;
                 %0.7 0.4;
                 0.7 0.1];
elseif(set == 2)    
    landmarks = [0.1 0.1;
                 0.1 0.5;
                 0.1 0.9;
                 0.5 0.9;
                 0.9 0.9;
                 0.9 0.5;
                 0.9 0.1;
                 0.5 0.1];
             
elseif(set == 3)
    landmarks = [0.25 1;
                 0.25 2;
                 0.25 3;
                 0.25 4;
                 1.25 4;
                 2.25 4;
                 3.25 4;
                 4.25 4;
                 4.25 3;
                 4.25 2;
                 4.25 1;
                 3.25 1;
                 2.25 1;
                 1.25 1];
             
     landmarks = landmarks - ones(length(landmarks),2)*2.5;
end