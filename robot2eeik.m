% function for inputing robot location and 2 arm lengths and computes the
% inverse kinematic for desired end effector location
% INPUT
    % robotXY (vector): coordinates for robot in XY direction
    % eeXY (vector): coordinates for end-effector in XY 
    % linkLength (vector): length of 2 links

% OUTPUT
%   linkA: elbow down solution
%   linkB: elow up solution


function [linkA, linkB] = robot2eeik(robotXY, eeXY, linkLength)

% set length of links 1 and 2
L1 = linkLength(1);
L2 = linkLength(2);


% define desired position of the end-effector
xe0 = eeXY(1);
ye0 = eeXY(2);

% define robot base location
robx = robotXY(1);
roby = robotXY(2);

% % enc-effector relative to robot
% xe = xe0 - robx;
% ye = ye0 - roby;

% plot stuff
% figure(1)
% T0 = eye(4); % for plotting purposes only, we define this reference frame at the base
% grid on
% volume_length =L1+L2;
% plotvol(volume_length)
% xlim([robx - volume_length robx + volume_length]);
% ylim([roby - volume_length roby + volume_length]);
% hold on
% view([0,90])
% xlabel('x [m]')
% ylabel('y [m]')
% plot(robx, roby, 'or')
% % trplot(T0)

% get input
% [xe0, ye0] = ginput(1);  

% plot end effector
% plot_sphere([xe0; ye0; 0], 0.05,  'r');

% enc-effector relative to robot
xe = xe0 - robx;
ye = ye0 - roby;

% solve analytical inverse kinematics
%
% solution 1: elbow down
L = sqrt(xe^2+ye^2);
gamma = atan2(ye,xe);
alpha = acos((-L2^2+L1^2+L^2)/(2*L1*L));
beta  = acos((-L^2+L1^2+L2^2)/(2*L1*L2));
theta11 = gamma-alpha;
theta21 = pi-beta;

x11 = robx + L1*cos(theta11);
y11 = roby + L1*sin(theta11);
x21 = robx + L1*cos(theta11)+L2*cos(theta21+theta11);
y21 = roby + L1*sin(theta11)+L2*sin(theta21+theta11);

% solution 2: elbow up
theta12 = gamma+alpha;
theta22 = beta-pi;

x12 = robx + L1*cos(theta12);
y12 = roby + L1*sin(theta12);
x22 = robx + L1*cos(theta12)+L2*cos(theta22+theta12);
y22 = roby + L1*sin(theta12)+L2*sin(theta22+theta12);

% plot required configuration of the manipulator
% figure(1)
% view([0,90])
% link1 = plot([robx x11], [roby y11], 'k-');
% link2 = plot([x11 x21], [y11 y21], 'k-');
% link3 = plot([robx x12], [roby y12], 'r-');
% link4 = plot([x12 x22], [y12 y22], 'r-');
linkA = [robx x11 roby y11 x11 x21 y11 y21]; % elbow down soluton
linkB = [robx x12 roby y12 x12 x22 y12 y22]; % elbow up soluton

% hold on

% xlim([robx - volume_length robx + volume_length]);
% ylim([roby - volume_length roby + volume_length]);
% grid on