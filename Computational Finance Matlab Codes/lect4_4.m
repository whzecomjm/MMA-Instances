
% Plot discrete sample paths
% sum of squrare returns
clear all;
close all;
clc;

randn('state',100);
%%%%%%%%% Problem parameters 
%%%%%%%%%%% 
S = 1; 
mu = 0.05; 
sigma = 0.5; 
L = 1e4; 
T = 1; 
dt = T/L; 
M = 1e2; 
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

% sum of squrare returns
returns = (Svals(:,2:end)-Svals(:,1:end-1))./Svals(:,1:end-1);
squreturns = ((Svals(:,2:end)-Svals(:,1:end-1))./Svals(:,1:end-1)).^2;

ssreturns = cumsum(squreturns,2);

figure;
plot(tvals(1:end-1),ssreturns);
title('sum of squrare returns')
xlabel('t'), ylabel('ssreturn(t)')