function MainFigure()

clear;
clc;

global vrep clientID jointHandle sensorHandle

vrep = remApi('remoteApi');
vrep.simxFinish(-1);

IPaddress = '127.0.0.1';
port = 19997;
waitUntilConnected = true;
doNotReconnectOnceDisconnected = false;
timeOutInMs = 5000;
waitToReTry = 5;

clientID = vrep.simxStart(IPaddress, port, waitUntilConnected, doNotReconnectOnceDisconnected, timeOutInMs, waitToReTry);

vrep.simxStartSimulation(clientID, vrep.simx_opmode_oneshot);

[~, jointHandle] = vrep.simxGetObjectHandle(clientID, 'Joint#', vrep.simx_opmode_oneshot_wait);

[~, sensorHandle] = vrep.simxGetObjectHandle(clientID, 'visionSensor#', vrep.simx_opmode_blocking);


window = figure('Name', 'Command window', 'Color', 'cyan', 'Position', [80 80 590 600]);

nbText = uicontrol('Style', 'Text',...
                    'String', 'Per chiudere la simulazione spostati nella Cmd Window e premi un tasto',...
                    'Position', [50 560 500 15]);

dxButton = uicontrol('Style', 'pushbutton',...
                        'String', 'Sposta la ripresa verso dx.',...
                        'FontName', 'Times New Roman',...
                        'FontWeight','bold',...
                        'Callback',@visionSensorDXMove,...
                        'Position', [10 10 210 40]);
                    
sxButton = uicontrol('Style', 'pushbutton',...
                        'String', 'Sposta la ripresa verso sx.',...
                        'FontName', 'Times New Roman',...
                        'FontWeight','bold',...
                        'Callback',@visionSensorSXMove,...
                        'Position', [385 10 200 40]);

imageScreen();


pause();
vrep.simxStopSimulation(clientID, vrep.simx_opmode_oneshot);
delete(window);

end