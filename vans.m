function [Ks, y] = vans (Vx)
Caf = 80000; Car = 80000; lf = 1.1; lr = 1.58; m = 1573;Iz = 2873; 
r22 = -(2*Caf+2*Car)/(m*Vx);
r23 = (2*Caf+2*Car)/m;
r24 = (-2*Caf*lf+2*Car*lr)/(m*Vx);
r42 = -(2*Caf*lf-2*Car*lr)/(Iz*Vx);
r43 = (2*Caf*lf-2*Car*lr)/Iz;
r44 = -(2*Caf*lf^2+2*Car*lr^2)/(Iz*Vx);
A = [0 1 0 0;0 r22 r23 r24; 0 0 0 1; 0 r42 r43 r44];
B1 = [0 2*Caf/m 0 2*Caf*lf/Iz]';
B2 = [0 r24-Vx 0 r44]';
B = [B1 B2];
C  = [1 0 0 0;0 0 1 0];

%state equation where Vx = 30
r22s = -(2*Caf+2*Car)/(m*30);
r23s = (2*Caf+2*Car)/m;
r24s = (-2*Caf*lf+2*Car*lr)/(m*30);
r42s= -(2*Caf*lf-2*Car*lr)/(Iz*30);
r43s = (2*Caf*lf-2*Car*lr)/Iz;
r44s = -(2*Caf*lf^2+2*Car*lr^2)/(Iz*30);
As = [0 1 0 0;0 r22s r23s r24s; 0 0 0 1; 0 r42s r43s r44s];
B1s = [0 2*Caf/m 0 2*Caf*lf/Iz]';
B2s = [0 r24s-30 0 r44s]';
Bs = [B1s B2s];
Cs  = [1 0 0 0;0 0 1 0];

R = 1000;
phid_des = Vx/R;
opt = stepDataOptions('StepAmplitude',phid_des);
t1 = (0:0.1:10)';
Ts = 1; Mp = 10;
zeta = -log(Mp/100)/(sqrt(pi^2+(log(Mp/100)^2)));
wn = 4/(zeta*Ts);
p1 = -zeta*wn+wn*sqrt(zeta^2-1); %(-b+sqrt(b^2-4*a*c))/2a
p2 = -zeta*wn-wn*sqrt(zeta^2-1);
p3 = 10*(-zeta*wn);
p4 = p3-1;
sp_des = [p1 p2 p3 p4]; %desired poles derived from settling time and overshoot

Ks = place(As,Bs(:,1),sp_des);% using Vx=30 to design Ks
Acls = A-B(:,1)*Ks;
sys_cls = ss(Acls,B(:,2),C,0);
y = step(sys_cls,t1, opt);

plot(t1,y)
legend('e1','e2')
xlabel('t (s)')
ylabel('error 1(meter)/ error 2(radian)')
title(['Response at Vx =' num2str(Vx)])
%saveas(gcf,['velocityres' num2str(Vx) '.png'])
end