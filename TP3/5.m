H =  [0 0 0 ; 0 0 0 ; 0 0 0];
f = [4; 7; -3];

A = [-1 0 0; 0 -1 0; 0 0 1];

b = [-7; 4 ; 10];


Aeq = [0 0 0 ; 0 0 0 ; 0 0 1];
beq = [0; 0 ; 10];

[X,FVAL] = quadprog(H,f,A,b,Aeq,beq);