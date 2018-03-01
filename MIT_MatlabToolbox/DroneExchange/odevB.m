% Author: Tony Zheng 
% This function contains the ODEs for the velocity of the mass center,
% relative to the inertial frame, but expressed along the body-fixed frame
% basis vectors

function dvB = odevB(t,v,wx,wy,wz,tSpan)
wx = interp1(tSpan,wx,t);
wy = interp1(tSpan,wy,t);
wz = interp1(tSpan,wz,t);

dvB = skew_sym([wx;wy;wz])*[v(1);v(2);v(3)];
end