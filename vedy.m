function [sys,A,B,C] = vedy(Caf,Car,lf,lr,m,Vx,Iz)
r22 = -(2*Caf+2*Car)/(m*Vx);
r24 = -Vx-(2*Caf*lf-2*Car*lr)/(m*Vx);
r42 = -(2*Caf*lf-2*Car*lr)/(Iz*Vx);
r44 = -(2*Caf*lf*lf+2*Car*lr*lr)/(Iz*Vx);
A = [0 1 0 0;0 r22 0 r24; 0 0 0 1;0 r42 0 r44];
B = [0 2*Caf/m 0 2*lf*Caf/Iz]';
C = [1 0 0 0];
sys = ss(A,B,C,[]);
end