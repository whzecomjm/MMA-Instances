clc;
clear all;
close all;

% quantile-quantile plot

M = 100;

s=rng;

r1 = rand(M,1); 
r2 = randn(M,1); 

r1s = sort(r1);
r2s = sort(r2);

pvals = [1:M]/(M+1);

z1vals = pvals;
z2vals = sqrt(2)*erfinv(2*pvals-1);

subplot(221)
plot(r1s,z1vals,'rx')
hold on
xlim = max(abs(z1vals))+1;
plot([-xlim, xlim],[-xlim,xlim],'g-') % Reference of slope 1 
axis([-xlim, xlim -xlim, xlim]);
axis square;
title('U(0,1) sample and U(0,1) quantiles')


subplot(222)
plot(r2s,z1vals,'rx')
hold on
xlim = max(abs(z1vals))+1;
plot([-xlim, xlim],[-xlim,xlim],'g-') % Reference of slope 1 
axis([-xlim, xlim -xlim, xlim]);
axis square;
title('N(0,1) sample and U(0,1) quantiles')


subplot(223)
plot(r1s,z2vals,'rx')
hold on
xlim = max(abs(z2vals))+1;
plot([-xlim, xlim],[-xlim,xlim],'g-') % Reference of slope 1 
axis([-xlim, xlim -xlim, xlim]);
axis square;
title('U(0,1) sample and N(0,1) quantiles')


subplot(224)
plot(r2s,z2vals,'rx')
hold on
xlim = max(abs(z2vals))+1;
plot([-xlim, xlim],[-xlim,xlim],'g-') % Reference of slope 1 
axis([-xlim, xlim -xlim, xlim]);
axis square;
title('N(0,1) sample and N(0,1) quantiles')
