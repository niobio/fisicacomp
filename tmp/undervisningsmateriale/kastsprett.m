clf;
% Parameters
m = 0.2; % kg
g = 9.81; % m/s^2
vT = 20.0; % m/s
h = 2.0; % m
R = 0.1; % m
k = 1000.0; % N/m
r0 = [0 h]; 
v0 = [2.0 10.0]; % m/s
time = 20.0; % s
% Variables
D = m*g/vT^2;
dt = 0.001;
n = ceil(time/dt);
r = zeros(n,2);
v = zeros(n,2);
a = zeros(n,2);
t = zeros(n,1);
% Initial conditions
r(1,:) = r0;
v(1,:) = v0;
i = 1;
% Simulation loop
for i = 1:n-1
    if (r(i,2)<R)
        N = k*(R-r(i,2))*[0 1];
    else
        N = [0 0];
    end
    FD = - D*norm(v(i,:))*v(i,:);
    G = -m*g*[0 1];
    Fnet = N + FD + G;
    a(i,:) = Fnet/m;
    v(i+1,:) = v(i,:) + dt*a(i,:);
    r(i+1,:) = r(i,:) + dt*v(i+1,:);
    t(i+1) = t(i) + dt;
end
figure(1);
plot(r(:,1),r(:,2));
xlabel('x [m]');
xlabel('y [m]');
figure(2);
subplot(3,1,1);
plot(t,v(:,1));
ylabel('vx [m/s]');
subplot(3,1,2);
plot(t,v(:,2));
ylabel('vy [m/s]');
subplot(3,1,3);
plot(t,a(:,2));
xlabel('t [s]');
ylabel('ay [m/s2]');