clc;
clear all;
close all;

% Illustrates Normal distribution

dsig = 0.25;
dx = 0.05;
mu = 0;
[X,SIGMA] = meshgrid(-10:dx:10,1:dsig:10);
Z = exp(-(X-mu).^2./(2*SIGMA.^2))./sqrt(2*pi*SIGMA.^2); 
figure;
surf(X,SIGMA,Z)
figure;
mesh(X,SIGMA,Z)
figure;
surfc(X,SIGMA,Z)
figure;
waterfall(X,SIGMA,Z)
xlabel('x')
ylabel('\sigma')
zlabel('f(x)')
title('N(0,\sigma) density for various \sigma')