function [sys_cl,eig_cl]= pole_cl(A,B,C,p_des)
K = place(A,B(:,1),p_des);
eig_cl = eig(A-B(:,1)*K);
sys_cl = ss(A-B(:,1)*K,B(:,2),C,[]);
end