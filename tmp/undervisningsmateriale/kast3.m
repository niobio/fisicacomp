clf;
m = 0.2; % kg
g = 9.81; % m/s^2
h = 0.0; % m
r0 = [0 h];
v0norm = 20.0;
alpha = 45.0*pi/180.0;
v0 = v0norm*[cos(alpha) sin(alpha)];
time = 10.0; % s
dt = 0.001;
n = ceil(time/dt);
r = zeros(n,2);
v = zeros(n,2);
t = zeros(n,1);
% Initial conditions
r(1,:) = r0;
v(1,:) = v0;
i = 1;
% Simulation loop
while (r(i,2)>=0.0)
    Fnet = - m*g*[0 1];
    a = Fnet/m;
    v(i+1,:) = v(i,:) + dt*a;
    r(i+1,:) = r(i,:) + dt*v(i+1,:);
    t(i+1) = t(i) + dt;
    i = i + 1;
end
plot(r(1:i,1),r(1:i,2));
xlabel('x [m]');
ylabel('y [m]');