
% Plot discrete sample paths
% test timescale invariance


clear all;
close all;
clc;

seed = rng;
%%%%%%%%% Problem parameters 
%%%%%%%%%%% 
S = 1; 
mu = 0.05; 
sigma = 0.2; 
L = 1e2; 
T = 1e-3; 
dt = T/L; 
M = 1e1; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tvals = [0:dt:T];

% Hint: cumprod, cumulative product

Svals = S*cumprod(exp((mu-0.5*sigma^2)*dt + sigma*dt*randn(M,L)),2); 
Svals = [S*ones(M,1) Svals]; 
% add initial asset price
figure;
plot(tvals,Svals);
title([num2str(M) ' asset paths']);
xlabel('t'), ylabel('S(t)')
