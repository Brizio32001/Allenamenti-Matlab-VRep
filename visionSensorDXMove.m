function visionSensorDXMove(hObject, evt)

global vrep clientID jointHandle

vrep.simxSetJointTargetVelocity(clientID, jointHandle, -0.5, vrep.simx_opmode_oneshot_wait);

pause(0.2);

vrep.simxSetJointTargetVelocity(clientID, jointHandle, 0, vrep.simx_opmode_oneshot_wait);

imageScreen();

end