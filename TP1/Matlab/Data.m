clc,clear;
M1 = 30; M2 = 250; k= 2*10^4; k1 = 2*10^5; f = 1000;
A = [ 0 1 0 0
      -(k1+k)/M1 -f/M1 k/M1 f/M1
      0            0    0     1
      k/M2        f/M2   -k/M2  -f/M2];
B = [0; -1/M1; 0; 1/M2];
Bd = [0; k1/M1; 0 ; 0];
CX= eye(4);
C = [-1 0 1 0];
D=[0;0;0;0]; 
sys = ss (A,B,CX,D);

t=0:0.001:5;
u=0*t;
X0= [0.0022, -0.1146, 0.0421, -0.0138]';

%lsim(sys,u,t,X0)

% La commandabilité:
CC = [B A*B A*A*B A*A*A*B];
rank(CC);

%%
%1
R = 10^(-8) ; %Qx = 10*eye(4);
Qy = 1 ;
Qx = C'*Qy*C;
N=0;
K = lqr(A,B,Qx,R,N)

%

%% Eestimateur d'etat optimal, Filtre de Kalman:
Cac=A(4,:);
sys = ss (A,B,Cac,1/M2);
% %==========================
% Qx4 = 10 ;
% Q2 = C'*Qy*C +  L4'*Qx4*L4;
%===============================
r0 = 0.01; r1 = 0.01;  Nn=0;
[Sys_ob,Kf] = kalman(sys,r0,r1,Nn); Kf
M = [0 1 0 0]';
W = r0*(M*M');
Kff = (lqr(A',C',W,r1))'
% ===============les valeurs propres:==================
% %% Asservissement:
% Z = zeros(4,1);
% Ae = [A Z
%       C 0];
% Be = [B;0];
% Ce = [C 0.];
% R = 10^-10 ; 
% Qy = 10 ;
% Qx = Ce'*Qy*Ce;
% N=0;

% K = lqr(Ae,Be,Qx,R,N);
%[Be Ae*Be Ae^2*Be Ae^3*Be Ae^4*Be];

%% ================================
 r0 = 0.01; r1 = 0.01;  Nn=0;
 Bd = [0; k1/M1; 0 ; 0];
 Cac = A(4,:);
 Dac = 1/M2 ; 
 sys = ss (A,[B Bd],Cac,[Dac 0]);
 [Sys_ob,Kf] = kalman(sys,r0,r1,Nn);Kf
Po = eig(A-Kf*Cac)
place(A',Cac',Po)
Pc = eig(A-B*K)
Abf=[A  -B*K
    Kf*Cac   A-Kf*Cac-B*K];
eig(Abf)
%% ===================
% s=tf('s');
% Ao = A-Kf*L4;
% Gx = (s*eye(4)-Ao)*Bp
% Gy = C*Gx
% bode(Gy)
