
function dualArm_stop()

joint_vel_ur101 = rospublisher('/ur101/joint_group_vel_controller/command','std_msgs/Float64MultiArray');
msg_ur101 = rosmessage(joint_vel_ur101);

joint_vel_ur102 = rospublisher('/ur102/joint_group_vel_controller/command','std_msgs/Float64MultiArray');
msg_ur102 = rosmessage(joint_vel_ur102);

msg_ur101.Data = [0.0 0.0 0.0 0.0 0.0 0.0];
msg_ur102.Data = [0.0 0.0 0.0 0.0 0.0 0.0];

send(joint_vel_ur101,msg_ur101);
send(joint_vel_ur102,msg_ur102);

end