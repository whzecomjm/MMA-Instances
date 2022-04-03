% Plots lognormal density function.
clf
close all;
clear all;

x = linspace(.01,4,500); 
t = 3; 
S = 1; 
mu = 0.05;
sigma = 0.3;
tempa = ((log(x/S) - (mu-0.5*sigma^2)*t).^2)/(2*t*sigma^2); 
tempb = x*sigma*sqrt(2*pi*t);
y1 = exp(-tempa)./tempb;
plot(x,y1,'r-')
ylim([0 1.5])
hold on
sigma = 0.5;
tempa = ((log(x/S) - (mu-0.5*sigma^2)*t).^2)/(2*t*sigma^2); 
tempb = x*sigma*sqrt(2*pi*t);
y2 = exp(-tempa)./tempb;
plot(x,y2,'b:')
legend('\sigma = 0.3','\sigma = 0.5',1);
title('Lognormal density, t = 1, S=1, \mu = 0.05');
xlabel('x'); 
ylabel('f(x)');