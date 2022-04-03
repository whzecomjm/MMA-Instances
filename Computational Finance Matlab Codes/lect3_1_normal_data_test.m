clc;
clear all;
close all;

y=yahoo;

stock = 'ibm'; % 'ko' 'mcd' 'pep'
% IBM? COCA-COLA McDonld Pepsi


ClosePriced = fetch(y,stock,'Close','Apr 6 2010','Apr 6 2013','d');
ClosePricew = fetch(y,stock,'Close','Apr 6 2010','Apr 6 2013','w');

rd = (ClosePriced(2:end,2)-ClosePriced(1:end-1,2))./ClosePriced(1:end-1,2);
figure;
plot(rd);
rw = (ClosePricew(2:end,2)-ClosePricew(1:end-1,2))./ClosePricew(1:end-1,2);
figure;
plot(rw);

% r-ratio , log(S(i+1)/S(i))
rr = log(ClosePriced(2:end,2)./ClosePriced(1:end-1,2));
figure;
plot(rr);

mrd = mean(rd); srd = std(rd);
rdp = (rd-mrd)/srd;
figure;
plot(rdp);

figure;
qqplot(rdp);

figure;
myhist(rdp);

% is the data after processing normal now? Use QQ plot to test it.

% If you try ko, mcd or pep stock, what happens and can you explain the reason?


