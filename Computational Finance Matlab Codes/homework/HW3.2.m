clf
clear all
s0 = 5;%initial price
n = 10; %% n sample paths 
dur = 1000;
step = 10000;
dt = dur/step;
Vect = linspace(0,dur,step); 
u = 0.10;
sigma = 0.3;
r = randn(n,step);
cr = cumsum(r,2);
increm = u*dt+sigma*sqrt(dt)*r-0.5*sigma^2*dt*r.^2;

logRatio = (ones(n,1)*Vect)*(u - sigma^2/2) + sigma*sqrt(dt)*cr;

s = s0*exp(logRatio);
ssq = s.^2;
plot(Vect',ssq');



