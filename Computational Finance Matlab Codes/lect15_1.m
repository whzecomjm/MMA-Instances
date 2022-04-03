% Implements binomial method for an American put.
%%%%%% Problem and method parameters %%%%%%%%%

S = 9;
E = 10;
T = 3;
r = 0.06;
sigma = 0.3;
M = 400;
dt = T/M;
p =0.5;
u = exp(sigma*sqrt(dt) + (r-0.5*sigma^2)*dt);
d = exp(-sigma*sqrt(dt) + (r-0.5*sigma^2)*dt);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initial computations
dpowers = d.^([M:-1:0]');
upowers = u.^([0:M]');

% Time T option values
W = max(E-S*dpowers.*upowers,0);

% Work back to option value at time zero
for i = M:-1:1
    Si = S*dpowers(M-i+2:M+1).*upowers(1:i);
    W = max(max(E-Si,0),exp(-r*dt)*(p*W(2:i+1)+(1-p)*W(1:i)));
end

disp('Option value is')
disp(W)