% Generate stock price with lognormal d
clear all;
close all;

x = linspace(.01,4,500);
T = 10;
S0 = 100;
mu = 0.05;
sigma = 0.3;
% M time intervals
M=100;
dt = T/M;
t = 0:dt:T;

s=rng;

figure(1);
hold on;
for k=1:30;
    r = randn(1,M+1);  r(1)=0;
    % vectorized code
    cr = cumsum(r);
    S = S0*exp((mu-sigma^2/2)*t + sigma*(dt).^(1/2)*cr);
    plot(t,S);
end


% y=S0*(1-1.96*sigma*sqrt(t))
title('Stock price, t = 1, S=1, \sigma = 0.2, \mu = 0.05');
xlabel('t');
ylabel('S(t)');
hold off;
