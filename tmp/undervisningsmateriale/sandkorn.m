clear;
a0 = 6.2; % m/s^2
c = 1.8; % s^-1
time = 2.0; % s
dt = 0.001; % s
n = ceil(time/dt);
t = zeros(n,1);
x = zeros(n,1);
v = zeros(n,1);
a = zeros(n,1);
x(1) = 2.0; % m
t(1) = 0.0; % s
v(1) = 0.0; % m/s
i = 1;
while (i<n-1)&&(x(i)>0.0)
  a(i) = -a0 -c*v(i);
  v(i+1) = v(i) + dt*a(i);
  x(i+1) = x(i) + dt*v(i);
  t(i+1) = t(i) + dt;
  i = i + 1;
end
printf ("t=%f  x(t)=%f\n",t(i),x(i));
subplot(3,1,1)
plot(t(1:i),x(1:i))
xlabel('t [s]')
ylabel('x [m]')
subplot(3,1,2)
plot(t(1:i),v(1:i))
xlabel('t [s]')
ylabel('v [m/s]')
subplot(3,1,3)
plot(t(1:i-1),a(1:i-1))
xlabel('t [s]')
ylabel('a [m/s^2]')