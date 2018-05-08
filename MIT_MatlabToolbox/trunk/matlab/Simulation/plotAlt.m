  
% figure('Name','Altitude');

% altitude from pressure (for comparison only)
altPrs = (sensordata_datout.prs.Data - sensordataCalib_datout.Data(:,7))/(quadEDT.altToPrs_gain);    
hold off;
plot(sensordata_datout.prs.Time, altPrs); hold all;    
% altitude from sonar
plot(sensordata_datout.altitude_sonar.Time, -sensordata_datout.altitude_sonar.Data,'LineWidth',2);

% altitude from KF
plot(states_estimout.Z.Time,states_estimout.Z.Data,'LineWidth',3);

% altitude reference
plot(pose_refout.Time,pose_refout.Data(:,3),'g','LineWidth',2);


legend({'Pressure $\hat{z}_{prs}$'  'Sonar $\hat{z}_{snr}$' 'Kalman-estimate $\hat z$' 'Reference $z_{d}$' },'Interpreter','latex');
ylim([-3.5 1]);
xlim([15 40]);
xlabel({'t[s]'},'Interpreter','latex');
ylabel({'altitude [m]'},'Interpreter','latex');