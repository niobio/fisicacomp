clear all; clf;
% Initialize
m = 0.1;    % kg
k = 1000.0; % N/m
R = 0.1;    % m
v0 = 0.0;   % m/s
y0 = 0.5;   % m
g = 9.8;    % m/s
time = 2.0; % s
% Numerical setup
dt = 0.0001; % s
n = ceil(time/dt);
t = zeros(n,1);
y = zeros(n,1);
v = zeros(n,1);
N = zeros(n,1);
% Initial values
y(1) = y0;
v(1) = v0;
% Simulation loop
for i = 1:n-1
    if (y(i)>R)
        N(i) = 0.0;
    else
        N(i) = k*(R-y(i));
    end
    Fnet = N(i) - m*g;
    a = Fnet/m;
    v(i+1) = v(i) + a*dt;
    y(i+1) = y(i) + v(i+1)*dt;
    t(i+1) = t(i) + dt;
end
% Plot results
figure(1)
subplot(3,1,1)
plot(t,y,'-b',[t(1) t(end-1)],[R R],'-r')
ylabel('y [m]')
subplot(3,1,2)
plot(t,v,'-b')
ylabel('v [m/s]')
subplot(3,1,3)
G = m*g*ones(n,1);
plot(t,N,'-b',t,G,'-r');
xlabel('t [s]')
ylabel('F [N]')
legend('N','G');  

