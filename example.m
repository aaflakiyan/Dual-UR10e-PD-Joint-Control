% this example is for joint velocity controllers of both robots

clear all
clc

rosshutdown;
rosinit;

q1 =   [-1.8664 -1.3865 0.3402 -1.1085 1.4899 -0.4095]';
q2 =   [-1.8664 -1.3865 0.3402 -1.1085 1.4899 -0.4095]';

x1 = [0.01, 0, 0, 0, 0, 0];
x2 = [0.01, 0, 0, 0, 0, 0];


controllers = 'cart'; % 'cart' for cartesian controllers and 'joint' for joint controllers

if controllers == 'cart'

dualArm_stop();

joint_position_controller(q1,q2);

elseif controllers == 'joint'
    
dualArm_cartesianVel(x1,x2);

pause(2);

x1 = zeros(1,6);
x2 = zeros(1,6);

% to stop the robots
dualArm_cartesianVel(x1,x2);

end




