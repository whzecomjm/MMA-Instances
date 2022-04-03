% Error bar plot
close all;
clear all;
clc;

x = linspace(.01,4,500);
T = 1;
S0 = 1;
mu = 0.05;
sigma = 0.1;
% # samples;
n = 10;
% M time intervals
M=100;
dt = T/M;
t = 0:dt:T;

s=rng;

figure(2);
hold on;

r = randn(n,M+1);  r(:,1)=0;
% vectorized code
cr = cumsum(r,2);
S = S0*exp((mu-sigma^2/2)*(ones(n,1)*t) + sigma*sqrt(dt)*cr);
plot(t',S');
m = mean(S);
s = std(S);
e = 1.96*sigma*sqrt(t);
errorbar(t,m,1.96*s);
y=S0*(1-1.96*sigma*sqrt(t))
plot(t,y,'r-');
y=S0*(1+1.96*sigma*sqrt(t))
plot(t,y,'r-');
%axis([0 1 0 1.5])

title('Stock price, confidence interval');
xlabel('t');
ylabel('S(t)');
hold off;
