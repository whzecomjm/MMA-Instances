% Draws Black-Scholes surface for European put
clear all;
close all;
clc;
%%%%%%%% Problem parameters %%%%%%%%%

E = 1; r = 0.05; sigma = 0.3; T = 1; L =50;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Svals = linspace(0,3,L);
tvals = linspace(0,T,L);
Cdelta = zeros(L,L);
for i = 1:L
    S = Svals(i);
    for j = 1:L
        t = tvals(j);
        [Call,Calldelta,Put,Putdelta] = lect5_1_bs_price(S,E,r,sigma,T-t);
        Cdelta(i,j) = Calldelta;
    end
end
[Smat,tmat] = meshgrid(Svals,tvals); mesh(Smat,tmat,Cdelta')
ylabel('S');
xlabel('t');
zlabel('CallDelta(S,t)');