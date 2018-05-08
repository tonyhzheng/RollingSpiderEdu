clc
clear
close all
load simulation_fast_square2

motor_commands = rt_yout_sim.signals(1).values;
X = rt_yout_sim.signals(2).values;
Y = rt_yout_sim.signals(3).values;
Z = rt_yout_sim.signals(4).values;

yaw = rt_yout_sim.signals(5).values;
pitch= rt_yout_sim.signals(6).values;
roll = rt_yout_sim.signals(7).values;

figure
plot(tout,X,tout,Y,tout,Z)
legend('X','Y','Z','Location','best')
xlabel('Time (s)')
ylabel('Position (m)')
title('Position vs Time')

figure
plot(X,Y)
xlabel('X (m)')
ylabel('Y (m)')
title('Drone Trajectory')

figure
plot(tout,yaw,tout,pitch,tout,roll)
legend('Yaw','Pitch','Roll','Location','best')
xlabel('Time (s)')
ylabel('Angle (rad)')
title('Orientation vs Time')

figure
plot(tout,motor_commands)
legend('T1','T2','T3','T4','Location','best')
xlabel('Time (s)')
ylabel('Motor Command')
title('Motor Commands vs Time')