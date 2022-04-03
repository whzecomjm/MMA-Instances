% Computes historical volatility from artificially generated data
clf;
s=rng;
%%%%%%%%%%% Parameters %%%%%%%%%%%%%
sigma = 0.3; r = 0.03; M = 2e3; Dt = 1/(M+1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
asset = cumprod(exp((r-0.5*sigma^2)*Dt+sigma*sqrt(Dt)*randn(M+1,1)));
U = log(asset(2:end)./asset(1:end-1));
%% Monte Carlo estimate based on all data %%
Umean = mean(U);
Ustd = std(U);
sigma1 = Ustd/sqrt(Dt)
cont = [sigma1*(1-1.96/sqrt(2*M)), sigma1*(1+1.96/sqrt(2*M))]
%% Simplified estimate (assumes zero mean)
sigma2 = sqrt(sum(U.^2)/((M-1)*Dt))
%% Running EWMA %%
%% First get a starting value %%
s = zeros(M,1);
L = 20;
V = U(1:L);
s(L) = std(V)/sqrt(Dt);
%% Now do EWMA %%
w = 0.94;
for n = L:M-1
    s(n+1) = sqrt((w*Dt*s(n)^2 + (1-w)*U(n+1)^2)/Dt);
end
sigma3 = s(end);
plot([L:M], s(L:end),'r-d')
hold on;
plot([1 M],[sigma sigma],'b--','LineWidth',2);
xlabel('t');
ylabel('Volatility');
ylim([0, 0.5]);
grid on