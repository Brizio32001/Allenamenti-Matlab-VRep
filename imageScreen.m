function imageScreen

global vrep clientID sensorHandle

[~, ~, visionImage] = vrep.simxGetVisionSensorImage2(clientID, sensorHandle, 0, vrep.simx_opmode_oneshot_wait);

imshow(visionImage);

end