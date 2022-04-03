% Compute expected payoff for European call
% Illustrates risk neutrality
clear all;
close all;
clc;
%%%%% Problem parameters %%%%%%
S=5; E=7; r=0.08; sigma=0.3; T=1; M = 200;
muvals = linspace(0,0.16,M);

%%%%%%%%%%%%%%%%%%%%%%%
epayoff = zeros(M,1);
for k = 1:M
    mu = muvals(k);
    % work out time-zero Black-Scholes value with r = mu
    [C, Cdelta, P, Pdelta] = lect5_1_bs_price(S,E,mu,sigma,T);
    epayoff(k) = exp((mu-r)*T)*C;
end
% true Black?Scholes value
[C, Cdelta, P, Pdelta] = lect5_1_bs_price(S,E,r,sigma,T);
plot(muvals,epayoff,'r-');
hold on
grid on
plot([muvals(1),muvals(end)],[C,C],'b-');

xlabel('\mu')
legend('Expected payoff','Black-Scholes')