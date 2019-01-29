clear all; clf; % Physical constants
g = 9.8;
D = 0.22;
m = 70.0; % Mass of jumper
kv = 30.0;
k = 200.0;
h = 100.0; % Height of bridge
d = 50.0;  % Length of cord
time = 40.0;
dt = 0.001;
% Initial conditions
v0 = 0;
x0 = h;
% Numerical initialization
n = time/dt;
x = zeros(n,1);
v = zeros(n,1);
a = zeros(n,1);
t = zeros(n,1);
% Set initial values
x(1) = x0;
v(1) = v0;
% Integration loop
for i = 1:n-1
  if (x(i)<h-d)
      F = k*(h-d-x(i)) - kv*v(i);
  else
      F = 0.0;
  end
  a(i) = F/m -g - (D/m)*v(i)*abs(v(i));
  v(i+1) = v(i) + a(i)*dt;
  x(i+1) = x(i) + v(i+1)*dt;
  t(i+1) = t(i) + dt;
end
% Plot results
figure(1)
subplot(2,1,1)
plot(t,x);
xlabel('t [s]');
ylabel('x [m]');
hold on
xd = ones(length(x),1)*d;
plot(t,xd,'-r')
subplot(2,1,2);
plot(t,v);
xlabel('t [s]');
ylabel('v [m/s]');

