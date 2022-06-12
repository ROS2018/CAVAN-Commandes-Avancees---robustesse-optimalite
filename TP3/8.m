%% Question 4 Excercice 2
clear all
Ap = 0.8;
Bp=0.1;
Cp=1;
Nc=4;
Np=10;

[Phi_Phi,Phi_F,Phi_R,Ae,Be,Ce]=mpcgain(Ap,Bp,Cp,Nc,Np);

Xki = [0.1 0.2]';
dU = inv(Phi_Phi) *(Phi_R - Phi_F * Xki);
