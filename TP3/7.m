%% Conversion vers un system discret:
Ac = [0 1 0;3 0 1; 0 1 0]
Bc = [1;1;3]
Cc = [0 1 0]
Dc = 0
Dt = 1
[Ad,Bd,Cd,Dd] = c2dm(Ac,Bc,Cc,Dc,Dt)

%% Question 3 creation du systeme augmente

zero =diag(zeros(length(Ad)));
Ae = [Ad zero'
      Cd*Ad 1];
Be = [Bd ; Cd*Bd];
Ce = [zero 1];


