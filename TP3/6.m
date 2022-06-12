%% exercice 3 optimisation avec quadprog
H = diag([1/2 ; 0]);
f = [3;4];
A = [-1 -3; 2 5; 3 4];
b = [-15; 100; 80];
l = zeros(2,1);

[X,FVAL] = quadprog(H,f,A,b)

