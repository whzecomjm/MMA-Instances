clc;
clear all;
close all;

% Histogram illustration of Central Limit Theorem

colormap([0.5 0.5 0.5]) 
s=rng;                     % random number generator
n = 5e+2;
M = 1e+4;
mu = 2;
sigma = sqrt(0.5*(exp(2)-7));
S = zeros(M,1); 

for k = 1:M
S(k) = (sum(exp(sqrt(rand(n,1)))) - n*mu)/(sigma*sqrt(n)); 
end
%%%%%%%%%%%%%%%% Histogram %%%%%%%%%%%%%%%%%%% 
dx = 0.5;
centers = [-4:dx:4];
N = hist(S,centers);
bar(centers,N/(M*dx))
hold on
x = linspace(-4,4,100);
y = exp(-0.5*x.^2)/sqrt(2*pi); 
plot(x,y,'b-','Linewidth',3) 
legend('N(0,1) density','Sample data') 
grid on