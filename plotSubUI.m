all_fig = findall(0, 'type', 'figure');
close(all_fig)

clc
clear

% figure('units','normalized','outerposition',[0 0 1 1]);
figSim = uifigure('Position',[100 100 620 630]);
b = uibutton(figSim, ...
    "Text","Go Home", ...
    "IconAlignment","top", ...
    "Position",[100 100 80 20]);

p1 = uipanel(figSim,'Position',[10 10 600 300]);
ax = uiaxes(p1,'Position',[10 10 590 290]);
p2 = uipanel(figSim,'Position',[10 320 600 140]);
bx = uiaxes(p2,'Position',[10 10 590 130]);
p3 = uipanel(figSim,'Position',[10 470 600 140]);
cx = uiaxes(p3,'Position',[10 10 590 130]);

figSim.Color = '#D2E1F0';
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.Title.String = 't1 & t2';
plot(ax, [0:10], [0:10].^2); % <<< made up data to plot; replace with your original plot call
p2.AutoResizeChildren = 'off';

plot(bx, [0:100], [0:100].^3); % <<< made up data to plot; replace with your original plot call

plot(cx, [0:0.01:4*pi], sin([0:0.01:4*pi])); % <<< made up data to plot; replace with your original plot call