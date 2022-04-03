% Up-and-out call option
% Uses Monte Carlo with antithetic variates
s=rng;

%%%%%% Problem and method parameters %%%%%%%%%

S=5; E=6; 
sigma=0.25; 
r=0.05; 
T=1;
B=9;
Dt = 1e-3; 
N = T/Dt; 
M = 1e4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V = zeros(M,1); Vanti = zeros(M,1);
for i = 1:M
    samples = randn(N,1);
    % standard Monte Carlo
    Svals = S*cumprod(exp((r-0.5*sigma^2)*Dt+sigma*sqrt(Dt)*samples));
    Smax = max(Svals);
    if Smax < B
        V(i) = exp(-r*T)*max(Svals(end)-E,0);
    end
    % antithetic path
    Svals2 = S*cumprod(exp((r-0.5*sigma^2)*Dt-sigma*sqrt(Dt)*samples));
    Smax2 = max(Svals2);
    V2 = 0;
    if Smax2 < B
        V2 = exp(-r*T)*max(Svals2(end)-E,0);
    end
    Vanti(i) = 0.5*(V(i) + V2);
end
aM = mean(V); bM = std(V);
conf = [aM - 1.96*bM/sqrt(M), aM + 1.96*bM/sqrt(M)]
aManti = mean(Vanti); bManti = std(Vanti);
confanti = [aManti - 1.96*bManti/sqrt(M), aManti + 1.96*bManti/sqrt(M)]