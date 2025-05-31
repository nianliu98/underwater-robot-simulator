%%
close all

%% Arm lengths

armLengths = [5, 4, 3, 2.5, 2, 1.5, 1 ];
workTime = [18.2, 18.2, 16.8, 13, 7, 1.6, 0] ./ 18.2 * 100;

figure
plot(armLengths, workTime, 'xk', MarkerSize=9)
xlabel('Length of Each Manipulator Link (m)')
ylabel('% Work Time')
grid on
grid minor

%% different density 
robNames = {'Oil', 'Sea Water', 'Honey'};

rob = {};
rob{1} = load("data\RobotSim_oil.mat");
rob{2} = load("data\RobotSim_sea.mat");
rob{3} = load("data\RobotSim_honey.mat");
rob{4} = load("data\RobotSim_sea_control_off.mat");

zero = zeros(length(rob{1}.time.t), 1);

figure;
x0=600;     % location of figure in the screen
y0=200;     % location of figure in the screen
width=600;  % width of figure
height=500; % height of figure
set(gcf,'position',[x0,y0,width,height])
% sgtitle('Positional Errors')
subplot(3,1,1)
for ii = 1:3
    plot(rob{ii}.time.t, rob{ii}.waves.eta, 'LineWidth', 1, 'DisplayName', robNames{ii});
    hold on
end
    xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
    ylim([min(rob{1}.waves.eta)*1.2 max(rob{1}.waves.eta)*1.2]);
    xlabel('Time (s)');
    ylabel('Wave Height (m)');
    grid on
    grid minor
    plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
    hold off

subplot(3,1,2)
for ii = 1:3
    plot(rob{ii}.time.t, rob{ii}.volturnus.robotPlots.px-rob{ii}.volturnus.DC.px, 'LineWidth', 1, 'DisplayName', robNames{ii});
    hold on
end
    xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
    %ylim([min(volturnus.robotPlots.px)*1.2 max(volturnus.robotPlots.px)*1.2]);
    xlabel('Time (s)');
    ylabel('Surge error (m)');
    grid on
    grid minor
    
    plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
    hold off
    %set(gca, 'Fontsize', 18);
    legend(robNames);
        
subplot(3,1,3)
for ii = 1:3
    plot(rob{ii}.time.t, rob{ii}.volturnus.robotPlots.pz-rob{ii}.volturnus.DC.pz, 'LineWidth', 1, 'DisplayName', robNames{ii});
    hold on
end
    xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
    %ylim([min(volturnus.robotPlots.pz)*1.001 max(volturnus.robotPlots.pz)*0.999]);    
    xlabel('Time (s)');
    ylabel('Heave error (m)');
    grid on
    grid minor

    hold on
    plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
    hold off
    %set(gca, 'Fontsize', 18);
    
%% control on off

figure;
x0=600;     % location of figure in the screen
y0=200;     % location of figure in the screen
width=600;  % width of figure
height=500; % height of figure
set(gcf,'position',[x0,y0,width,height])
% sgtitle('Positional Errors')
% subplot(2,1,1)
% for ii = [2,4]
%     plot(rob{ii}.time.t, rob{ii}.waves.eta, 'LineWidth', 1, 'DisplayName', robNames{ii});
%     hold on
% end
%     xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
%     ylim([min(rob{1}.waves.eta)*1.2 max(rob{1}.waves.eta)*1.2]);
%     xlabel('Time (s)');
%     ylabel('Wave Height (m)');
%     grid on
%     grid minor
%     plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
%     hold off

subplot(2,1,1)
for ii = [2,4]
    plot(rob{ii}.time.t, rob{ii}.volturnus.robotPlots.px-rob{ii}.volturnus.DC.px, 'LineWidth', 1);
    hold on
end
    xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
    %ylim([min(volturnus.robotPlots.px)*1.2 max(volturnus.robotPlots.px)*1.2]);
    xlabel('Time (s)');
    ylabel('Surge error (m)');
    grid on
    grid minor
    
    plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
    hold off
    %set(gca, 'Fontsize', 18);
    legend('Controller On', 'Controller Off');
        
subplot(2,1,2)
for ii = [2,4]
    plot(rob{ii}.time.t, rob{ii}.volturnus.robotPlots.pz-rob{ii}.volturnus.DC.pz, 'LineWidth', 1);
    hold on
end
    xlim([min(rob{1}.time.t) max(rob{1}.time.t)]);
    %ylim([min(volturnus.robotPlots.pz)*1.001 max(volturnus.robotPlots.pz)*0.999]);    
    xlabel('Time (s)');
    ylabel('Heave error (m)');
    grid on
    grid minor

    hold on
    plot(rob{1}.time.t, zero, 'r', 'LineWidth', 1)
    hold off
    %set(gca, 'Fontsize', 18);