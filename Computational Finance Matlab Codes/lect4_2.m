% Plots lognormal density function % at end time

clear all;
close all;
clc;

randn('state',100);
%%%%%%%%% Problem parameters 
%%%%%%%%%%% 
S = 1; 
mu = 0.05; 
sigma = 0.4; 
L = 1e2; 
T = 1; 
dt = T/L; 
M = 1e3; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tvals = [0:dt:T];

% Hint: cumprod, cumulative product

Svals = S*cumprod(exp((mu-0.5*sigma^2)*dt + sigma*sqrt(dt)*randn(M,L)),2); 
Svals = [S*ones(M,1) Svals]; 
% add initial asset price
figure;
plot(tvals,Svals);
title([num2str(M) ' asset paths']);
xlabel('t'), ylabel('S(t)')



x = linspace(.01,4,500); 
t = T; 
tempa = ((log(x/S) - (mu-0.5*sigma^2)*t).^2)/(2*t*sigma^2); 
tempb = x*sigma*sqrt(2*pi*t);
y1 = exp(-tempa)./tempb;

figure;
plot(x,y1,'r-')
ylim([0 2.8])
hold on

ST = Svals(:,end);
M=length(ST);
dx = 0.125;
centers = [0:dx:4]';
N = hist(ST,centers);
bar(centers,N/(M*dx));



title(['Lognormal density, t = 1, S=' num2str(S) ', \mu = ' num2str(mu)]);
xlabel('x'); 
ylabel('f(x)');
hold off;