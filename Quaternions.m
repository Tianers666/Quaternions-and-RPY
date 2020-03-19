%%******RPY�Ǻ���Ԫ��֮����໥ת��******
%%Written by Rot_Tianers****************
%%Code created at:2020.03.19************
%%**************************************
function [x, y, z, w] = Quaternions(roll, pitch, yaw)
clc;
%%��֪��RPY��
%%��⣺��Ԫ���ĸ�����ֵ�����뵽ROS��

%%step1:����RPY��������ת���������ƶ���X��תroll\�ƶ���Y��תpitch\Z�ƶ�����תyaw��
gamma = roll;  %%gamma��x����ת����Ӧroll;
theta = pitch; %%theta��y����ת����Ӧpitch;
alpha = yaw;   %%alpha��z����ת����Ӧyaw;
R = [cos(alpha)*cos(theta) cos(alpha)*sin(theta)*sin(gamma)-sin(alpha)*cos(gamma) cos(alpha)*sin(theta)*cos(gamma)+sin(alpha)*sin(gamma);...
    sin(alpha)*cos(theta) sin(alpha)*sin(theta)*sin(gamma)+cos(alpha)*cos(gamma) sin(alpha)*sin(theta)*cos(gamma)-cos(alpha)*sin(gamma);...
    -sin(theta) cos(theta)*sin(gamma) cos(theta)*cos(gamma)];

%%step2:����ת����ʽ�����Ԫ���ĸ�ֵ
w = 0.5*sqrt(1+R(1,1)+R(2,2)+R(3,3));  %%w = cos(��ת��/2)
x = (R(3,2)-R(2,3))/(4*w);             %%x = kx*sin(��ת��/2)
y = (R(1,3)-R(3,1))/(4*w);             %%y = ky*sin(��ת��/2)
z = (R(2,1)-R(1,2))/(4*w);             %%z = kz*sin(��ת��/2)

%%step3:��֤�����ȷ��
threshold = 10^-3;  %%��ֵ
test = abs(abs(y*w-x*z)-0.5)
if (test<threshold)  %%������̬��������Ϊ��90��
    RPY.R = 0;                                      %%roll
    RPY.P = sign(y*w-x*z)*(pi/2);                   %%pitch
    RPY.Y = -2*sign(y*w-x*z)*atan2(x,w);            %%yaw
    RPY
    disp("����������");
else
    RPY.R = atan2(2*(z*y+w*x),1-2*(y^2+x^2));       %%roll
    RPY.P = asin(2*(y*w-x*z));                      %%pitch
    RPY.Y = atan2(2*(x*y+w*z),1-2*(y^2+z^2));       %%yaw
    RPY
    disp("�������");
end
end








