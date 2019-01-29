clear all; clf;
% Initialize
m = 1.0;    % kg
k = 100.0; % N/m
v0 = 1.0;   % in m/s
time = 2.0; % s
% Numerical setup
dt = 0.0001; % s
n = ceil(time/dt);
t = zeros(n,1);
x = zeros(n,1);
v = zeros(n,1);
% Initial values
x(1) = 0.0;
v(1) = v0;
% Simulation loop
for i = 1:n-1
    F = -k*x(i);
    a = F/m;
    v(i+1) = v(i) + a*dt;
    x(i+1) = x(i) + v(i+1)*dt;
    t(i+1) = t(i) + dt;
end
% Plot results
figure(1)
subplot(2,1,1)
plot(t,x,'-b');
xlabel('t [s]')
ylabel('x [m]')
subplot(2,1,2)
plot(t,v,'-b')
xlabel('t [s]')
ylabel('v [m/s]')

