% This function is for the time that you use twist_controller for both
% robots
% x1 = desired cartesian velocity for robot 1
% x2 = desired cartesian velocity for robot 2

function dualArm_cartesianVel(x1,x2)

Cartesian_vel_ur101 = rospublisher('/ur101/twist_controller/command','geometry_msgs/Twist');
msg_ur101 = rosmessage(Cartesian_vel_ur101);

Cartesian_vel_ur102 = rospublisher('/ur102/twist_controller/command','geometry_msgs/Twist');
msg_ur102 = rosmessage(Cartesian_vel_ur102);

msg_ur101.Linear.X = x1(1);
msg_ur101.Linear.Y = x1(2);
msg_ur101.Linear.Z = x1(3);
msg_ur101.Angular.X = x1(4);
msg_ur101.Angular.Y = x1(5);
msg_ur101.Angular.Z = x1(6);

msg_ur102.Linear.X = x2(1);
msg_ur102.Linear.Y = x2(2);
msg_ur102.Linear.Z = x2(3);
msg_ur102.Angular.X = x2(4);
msg_ur102.Angular.Y = x2(5);
msg_ur102.Angular.Z = x2(6);

send(Cartesian_vel_ur101,msg_ur101);
send(Cartesian_vel_ur102,msg_ur102);

end
