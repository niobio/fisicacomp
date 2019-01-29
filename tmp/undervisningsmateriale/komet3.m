clear all;
clf;
% Physical values
M = 1.99e30; % kg
G = 6.673e-11; % m^3 kg^-1 s^-2
% Initial conditions
R = 1.5e11; % m
r0 = R*[1 0];
v0mag = 3e4*0.33; % m/s
v0 = v0mag*[0.0 1.0];
% Numerical values
time = 60*60*24*365*1.5; % s
dt = 100; % s
% Setupt Simulation
n = ceil(time/dt)
r = zeros(n,2);
v = zeros(n,2);
t = zeros(n,1);
r(1,:) = r0;
v(1,:) = v0;
GM = G*M;
% Calculation loop
for i = 1:n-1
    rr = norm(r(i,:));
    a = -GM*r(i,:)/rr^3;
    v(i+1,:) = v(i,:) + dt*a;
    r(i+1,:) = r(i,:) + dt*v(i+1,:);
    t(i+1) = t(i) + dt;
end
plot(r(:,1),r(:,2),'-b');
xlabel('x [m]');
ylabel('y [m]');
axis([-2e11 2e11 -2e11 2e11]);
axis equal;
