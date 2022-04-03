
clear all;
close all;
clc;

%
% Illustrates delta hedging by computing an approximate
% replicating portfolio for a European call %
% Portfolio is 'asset' units of asset and an amount ?cash' of cash
% Plot actual and theoretical portfolio values
s=rng; 
%%%%%%%%% Problem parameters %%%%%%%%%%%% 
Szero = 1; sigma = 0.35; r = 0.03; mu = 0.02; T = 5; 
E = 1.5;
Dt = 1e-2; N = T/Dt; t = [0:Dt:T]; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S = zeros(N,1); asset = zeros(N,1); cash = zeros(N,1); 
portfolio = zeros(N,1); Value = zeros(N,1);

[C,Cdelta,P,Pdelta] = lect5_1_bs_price(Szero,E,r,sigma,T-t(1));
S(1) = Szero;
asset(1) = Cdelta;
Value(1) = C;
cash(1) = 1;
portfolio(1) = asset(1)*S(1) + cash(1);
for i = 1:N
S(i+1) = S(i)*exp((mu-0.5*sigma^2)*Dt+sigma*sqrt(Dt)*randn); 
portfolio(i+1) = asset(i)*S(i+1) + cash(i)*(1+r*Dt); 
[C,Cdelta,P,Pdelta] = lect5_1_bs_price(S(i+1),E,r,sigma,T-t(i+1));
asset(i+1) = Cdelta;
cash(i+1) = cash(i)*(1+r*Dt) - S(i+1)*(asset(i+1) - asset(i)); 
Value(i+1) = C;
end
Vplot = Value - (Value(1) - portfolio(1))*exp(r*t)'; 

% option value from the discrete hedging strategy
plot(t(1:5:end),Vplot(1:5:end),'bo');


hold on
% value of the replicating portfolio
plot(t(1:5:end),portfolio(1:5:end),'r-','LineWidth',2) 
xlabel('Time')
ylabel('Portfolio') 
legend('Theoretical Value','Actual Value')
grid on


kk=1;

