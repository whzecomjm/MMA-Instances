% Apply Netwon's method to N(x) + exp(x) = 2.


exact = fzero(inline('0.5*(1+erf(x/sqrt(2))) + exp(x)- 2'),1);

x0 = 1;
x = x0;
xdiff = 1;
k = 1;
kmax = 100; tol = 1e-8;
while (xdiff >= tol & k < kmax)
    Fval = 0.5*(1+erf(x/sqrt(2))) + exp(x) - 2; 
    Fprime = exp(-0.5*x^2)/sqrt(2*pi) + exp(x); 
    increment = Fval/Fprime;
    x = x - increment;
    xnewton(k) = x;
    newterr(k) = abs(xnewton(k)-exact);
    k = k+1;
    xdiff = abs(increment);
end
format short e 
% non-default for number display disp('Newton error')
disp(newterr')
format 
% reset to default for number display