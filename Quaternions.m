%%******RPY�Ǻ���Ԫ��֮����໥ת��******
%%Written by Rot_Tianers
%%Code creation at:2020.03.19
%%**************************************
function [x, y, z, w] = Quaternions(roll, pitch, yaw)
clc;
%%��֪��RPY��
%%��⣺��Ԫ���ĸ�����ֵ�����뵽ROS��

%%step1:����RPY��������ת���������ƶ���X��תroll\�ƶ���Y��תpitch\Z�ƶ�����תyaw��
alpha = roll;
theta = pitch;
gamma = yaw;
R = [cos(alpha)*cos(theta) cos(alpha)*sin(theta)*sin(gamma)-sin(alpha)*cos(gamma) cos(alpha)*sin(theta)*cos(gamma)+sin(alpha)*sin(gamma);...
    sin(alpha)*cos(theta) sin(alpha)*sin(theta)*sin(gamma)+cos(alpha)*cos(gamma) sin(alpha)*sin(theta)*cos(gamma)-cos(alpha)*sin(gamma);...
    -sin(theta) cos(theta)*sin(gamma) cos(theta)*cos(gamma)];
%%step2:����ת����ʽ�����Ԫ���ĸ�ֵ
w = 0.5*sqrt(1+R(1,1)+R(2,2)+R(3,3));  %%w = cos(��ת��/2)
x = (R(3,2)-R(2,3))/(4*w);             %%x = kx*sin(��ת��/2)
y = (R(1,3)-R(3,1))/(4*w);             %%y = ky*sin(��ת��/2)
z = (R(2,1)-R(1,2))/(4*w);             %%z = kz*sin(��ת��/2)

%%step3:��֤�����ȷ��
threshold = 10^-5;  %%��ֵ
test = abs(abs(y*w-x*z)-0.5);
if (test<threshold)  %%������̬��������Ϊ��90��
    RPY.R = atan2(2*(y*z+w*x),1-2*(y^2+x^2));
    RPY.Y = asin(2*(y*w-x*z));
    RPY.Z = atan2(2*(x*y+w*z),1-2*(y^2+z^2));
    RPY
    disp("����������");
else
    RPY.R = atan2(2*(y*z+w*x),1-2*(y^2+x^2));
    RPY.Y = asin(2*(y*w-x*z));
    RPY.Z = atan2(2*(x*y+w*z),1-2*(y^2+z^2));
    RPY
    disp("�������");
end
end








