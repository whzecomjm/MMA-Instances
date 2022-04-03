
% Plot discrete sample paths
% 
clear all;
close all;
clc;

randn('state',100);
%%%%%%%%% Problem parameters 
%%%%%%%%%%% 
S = 1; 
mu = 0.05; 
sigma = 0.2; 
L = 1e3; 
T = 1; 
dt = T/L; 
M = 1e4; 
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

figure;
plot(tvals,mean(Svals));
title('Mean path')
xlabel('t'), ylabel('S(t)')