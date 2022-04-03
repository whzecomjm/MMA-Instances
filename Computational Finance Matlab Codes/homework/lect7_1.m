function [C, Cdelta, Cgamma, Cvega, Crho, Ctheta, P, Pdelta, Pgamma, Pvega, Prho, Ptheta] = lect7_1(S,E,r,sigma,tau)
%
%
% Program for Chapter 10 This is a MATLAB function
% Input arguments: S = asset price at time t E = exercise price
% r = interest rate
% sigma = volatility
% tau = time to expiry (T-t)
% Output arguments: C = call value, Cdelta = delta value of call Cvega = vega value of call
% P = Put value, Pdelta = delta value of put Pvega = vega value of put
% function [C, Cdelta, Cvega, P, Pdelta, Pvega] = lect7_1(S,E,r,sigma,tau)
% 
S=1,E=1.5,r=0.05,sigma=0.2,tau=1; 

if tau > 0
    d1 = (log(S/E) + (r + 0.5*sigma^2)*(tau))/(sigma*sqrt(tau)); 
    d2 = d1 - sigma*sqrt(tau);
    N1 = 0.5*(1+erf(d1/sqrt(2)));
    N2 = 0.5*(1+erf(d2/sqrt(2)));
    C = S*N1-E*exp(-r*(tau))*N2;
    Cdelta = N1;
    Cgamma = exp(-0.5*d1^2)/(S*sigma*sqrt(2*pi*tau));
    Cvega = S*sqrt(tau)*exp(-0.5*d1^2)/sqrt(2*pi);
    Crho = tau*E*exp(-r*tau)*N2;
    Ctheta = -S*sigma/(2*sqrt(tau))*exp(-0.5*d1^2)/sqrt(2*pi)- r*E*exp(-r*tau)*N2;
    P = C + E*exp(-r*tau) - S;
    Pdelta = Cdelta - 1;
    Pgamma = Cgamma;
    Pvega = Cvega;
    Prho = Crho - tau*E*exp(-r*tau);
    Ptheta = Ctheta + r*E*exp(-r*tau);
else
    C = max(S-E,0);
    Cdelta = 0.5*(sign(S-E) + 1); 
    Cgamma = 0;
    Cvega = 0;
    Crho = 0;
    Ctheta = 0;
    P = max(E-S,0);
    Pdelta = Cdelta - 1;
    Pgamma = 0;
    Pvega = 0;
    Prho = 0;
    Ptheta = 0;
end
disp([C, Cdelta, Cgamma, Cvega, Crho, Ctheta, P, Pdelta, Pgamma, Pvega, Prho, Ptheta])