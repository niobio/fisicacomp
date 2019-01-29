clf;
x = linspace(0,pi,1000);
F = 2*sin(x.^2).*exp(-x);
subplot(2,1,1);
plot(x,F);
xlabel('x');
ylabel('F');
axis([0,pi,-0.4,0.8]);
I = trapz(x,F)
U = cumtrapz(x,-F);
subplot(2,1,2);
plot(x,U);
xlabel('x');
ylabel('U');
axis([0,pi,-0.7,0]);