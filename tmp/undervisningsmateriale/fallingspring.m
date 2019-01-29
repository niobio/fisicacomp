% falling two-spring
m = 0.1;
k = 200.0;
b = 0.2;
h0 = 1.0;
g = 9.8;
time = 2.0;
dt = 0.00001;
n = round(time/dt);
t = zeros(n,1);
xA = zeros(n,1);
vA = zeros(n,1);
xB = zeros(n,1);
vB = zeros(n,1);
xA(1) = h0 + b;
xB(1) = h0;
vA(1) = 0.0;
vB(1) = 0.0;
for i = 1:n-1
    f = k*(xA(i) - xB(i) - b);
    fA = -f - m*g;
    fB = f - m*g;
    aA = fA/m;
    vA(i+1) = vA(i) + aA*dt;
    xA(i+1) = xA(i) + vA(i+1)*dt;
    aB = fB/m;
    vB(i+1) = vB(i) + aB*dt;
    xB(i+1) = xB(i) + vB(i+1)*dt;
    t(i+1) = t(i) + dt;
    if (xB(i+1)<0.0)&&(xB(i)>=0.0)
        vB(i+1) = abs(vB(i+1));
    end
end
xcm = (xA+xB)*0.5;
vcm = (vA+vB)*0.5;
Kcm = 0.5*(2.0*m)*vcm.^2;
Kcmdelta = 0.5*m*(vA - vcm).^2+0.5*m*(vB-vcm).^2; 
Ug = xcm*(2.0*m)*g;
Uk = 0.5*k*(xA - xB - b).^2;
E = Kcm + Kcmdelta + Ug + Uk;
subplot(3,1,1)
plot(t,xA,'-b',t,xB,'-r',t,xcm,':k')
ylabel('x [m]');
subplot(3,1,2);
plot(t,Kcm,':k',t,Kcmdelta,'-g');%,t,Uk,'-y',t,E,':k')
ylabel('K [J]');
subplot(3,1,3);
plot(t,Ug,':k',t,Uk,'-g')
xlabel('t [s]');
ylabel('U [J]');