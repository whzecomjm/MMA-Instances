e1=20;
e3=40;
e2=(e1+e3)/2;
s=linspace(0,80,1000);
plot(s,max(s-e1,0),'b');
hold on; 
plot(s,max(s-e3,0),'b');
hold on;
plot(s,max(s-e1,0)+max(s-e3,0)-2*max(s-e2,0),'r');
hold on;
em=max(max(s-e1,0)+max(s-e3,0)-2*max(s-e2,0));
plot(line([e2,e2],[em,0]));

xlabel('S(T)');
ylabel('V(T)')
title('Payoff of hw1');
axis([0 80 0 40]);
text(20,1,'E1');
text(30,1,'E2');
text(40,1,'E3');



