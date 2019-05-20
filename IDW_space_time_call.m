% Spatio-temporal interpolation using IDW

%% Variable description
% val_stat - measured values at various stations (currently a random set).
% val_stat_plot, t_stat_plot - variable used for plotting.
% x_stat, y_stat, t_stat - space-time co-ordinates of various stations.
% x_int, y_int, t_int - query points at which interpolation occurs.
% e - exponent.
% val_int - stores interpolated values.
% N - no. of nearest neighbours.

%% Data points at various stations
% val_stat = [55,21,15,6,29,30,5];
val_stat = [[30,9,2,15],[21,25,8],15,[6,6,6,6,5,7,6.5],[29,17,13],[30,12,19,7],5];
val_stat_plot = {[30,9,2,15];[21,25,8];15;[6,6,6,6,5,7,6.5];[29,17,13];[30,12,19,7];5};
x_stat = {[1,6,10,5];[3,6,9];4;[7,9,4,3,8,6,4];[9,14,15];[11,4,5,3];16};

% y_stat = [1,3,4,7,9,11,16];
y_stat = {[1,2,8,12];[8,4,10];5;[6,7,8,9,10,11,12];[10,1,2];[3,7,9,12];14};
t_stat = [6:2:18];
t_stat_plot = {[6,6,6,6];[8,8,8];10;[12,12,12,12,12,12,12];[14,14,14];[16,16,16,16];18};

x_int = [1:15];
y_int = [1:15];
t_int = [1,2,5,7,8,10,18,3,5,9,11,15,17,13,12];

val_int = [];
e = -6;
N = 5;
%% Interpolation
val_int = IDW_space_time_func(x_int, y_int, t_int, x_stat, y_stat, t_stat,...
    t_stat_plot, val_stat, N, e);

%% Plots
figure(1);
color = jet(33);
hold on;
for k1 = 1:length(x_stat) 
    plot3(x_stat{k1}(1,:), y_stat{k1}(1,:), val_stat_plot{k1}(1,:), '+');
end
legend(string(t_stat));
view(3);
title('Readings from stations at various time stamps');
xlabel('x');
ylabel('y');
zlabel('Value');

figure(2);
mesh(val_int(:,:,8));
title('Interpolated plot');
xlabel('x');
ylabel('y');
zlabel('Value');

