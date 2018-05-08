u = 1;
y = [2;1];
xPrev = [1;5];
sigmaXPrev = [1 0;0 1];
sigmaW = diag([1;2;3]);
dT = 0.01;


[xEst, sigmaXEst] = KalmanFilter(u, y, xPrev, sigmaXPrev, sigmaW, dT)
function [xEst, sigmaXEst] = KalmanFilter(u, y, xPrev, sigmaXPrev, sigmaW, dT)
A = [1 dT;0 1];
B = [0;dT];
H = [1 0;1 0];
diagon = diag(sigmaW);
Q = diag(diagon(1));
R = diag(diagon(2:3));

x_p = A*xPrev+B*u;
P_p = A*sigmaXPrev*A'+Q;

K = P_p*H'*(H*P_p*H'+R)^-1;
xEst = x_p+K*(y-H*x_p);
sigmaXEst = (eye(2)-K*H)*P_p*(eye(2)-K*H)'+K*R*K';
end