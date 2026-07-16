function simulateScenario(simulationTime,waypoints,Vx,roadLenght)

sampleTime = 0.1;
scenario = drivingScenario("SampleTime",0.1);
simTime = (0:sampleTime:simulationTime)';  
roadCenters = [-1 0.12 0;
    13.28 0.12 0;
    32.44 4.59 0;
    56.54 4.75 0;
    63.2 4.7 0;
    90.7 6.7 0;
    106.2 5.3 0;
    136.4 -1.6 0;
    167.7 2.1 0;
    187.3 13.3 0];
dashW = laneMarking('Dashed','Space',5);
lnspec = lanespec(2,'Marking',dashW,'Width',4);
road(scenario, roadCenters,'Lanes',lnspec);
egoVehicle = vehicle(scenario,'ClassID',1,'Position',[0 0 0]);

speed = 15;
smoothTrajectory(egoVehicle,waypoints,speed)

plot(scenario);
set(gcf, 'Visible','on')

ButtonH=uicontrol('Style','pushbutton',...
    'String','Play','Units','normalized',...
    'Visible','on',...
    'callback',{@playButton,scenario});
    
    function playButton(src,event,scenario)
        while advance(scenario)
            pause(0.1) %increase for slower sim
        end
    end

end

