moveInterval = 2;
pauseInterval = 3;
xHold = 0;
yHold =0;
xref = 0;
yref =0;
for counter = 1:9000
counterDbl = counter;

if (counterDbl > 1500)
    tempTime = mod(counterDbl-1500,(moveInterval*4+pauseInterval*4)*200)*.005;
    fprintf("Time = %f\n",tempTime);
    fprintf("x = %f\n",xref);
    fprintf("y = %f\n",yref);
    if((tempTime>0)&&(tempTime<moveInterval))
    fprintf("Move Right\n");
    xHold = 0;
    yHold = tempTime/moveInterval/2;
    xref = 0;
    yref = tempTime/moveInterval/2; 

    elseif((tempTime>=moveInterval)&&(tempTime<moveInterval+pauseInterval))
    fprintf("Hold 1\n");
    xref = xHold;
    yref = yHold; 
    elseif((tempTime>=moveInterval+pauseInterval)&&(tempTime<moveInterval*2+pauseInterval))
    fprintf("Move Forward\n");
    xHold = (tempTime-moveInterval-pauseInterval)/moveInterval/2;
    xref = (tempTime-moveInterval-pauseInterval)/moveInterval/2;
    yref = yHold; 

    elseif((tempTime>=moveInterval*2+pauseInterval)&&(tempTime<moveInterval*2+2*pauseInterval))
    fprintf("Hold 2\n");
    xref = xHold;
    yref = yHold;

    elseif((tempTime>=moveInterval*2+2*pauseInterval)&&(tempTime<moveInterval*3+2*pauseInterval))
    fprintf("Move Left\n");
    xref = xHold;
    yref = yHold-(tempTime-moveInterval*2-2*pauseInterval)/moveInterval/2;

    elseif((tempTime>=moveInterval*3+2*pauseInterval)&&(tempTime<moveInterval*3+3*pauseInterval))
    fprintf("Hold 3\n");
    xref = xHold;
    yref = 0;
    elseif((tempTime>=moveInterval*3+3*pauseInterval)&&(tempTime<moveInterval*4+3*pauseInterval))
    fprintf("Move Back\n");
    xref = xHold-(tempTime-moveInterval*3-3*pauseInterval)/moveInterval/2;
    yref = 0;
    else
    fprintf("Hold 4\n");
    xref = 0;
    yref = 0;
        
    end
end

  end