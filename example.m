clear all
clc

rosshutdown;
rosinit;

q1 =   [-1.8664 -1.3865 0.3402 -1.1085 1.4899 -0.4095]';
q2 =   [-1.8664 -1.3865 0.3402 -1.1085 1.4899 -0.4095]';

dualArm_stop();

joint_position_controller(q1,q2);



