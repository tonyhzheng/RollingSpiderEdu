clc
clear
close all
load turn
sw=30; %smoothing window
tSpan = RSrun_sensordata(:,1);
ts = tSpan(2)-tSpan(1);

ax = movmean(RSrun_sensordata(:,2),sw);
ay = movmean(RSrun_sensordata(:,3),sw);
wz = movmean(RSrun_sensordata(:,7),sw);


r = 0.0889;
for i = 1:numel(wz)-1
alpha(i) = (wz(i+1)-wz(i))/ts;
end
figure
ayr = -alpha*r;
ayr = [ayr ayr(end)];
axr = wz.^2*r;
plot(tSpan,axr,tSpan,ayr,tSpan,ax,tSpan,ay)
legend('ax','ay','ax_{meas}','ay_{meas}','Location','best')

title('Acceleration')
ylabel({'accel $[m/s^2]$'},'Interpreter','latex');
xlabel({'Time $[s]$'},'Interpreter','latex');

