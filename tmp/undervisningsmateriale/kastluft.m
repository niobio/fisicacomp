clf;
% Parameters
m = 0.2; % kg
g = 9.81; % m/s^2
vT = 20.0; % m/s
D = m*g/vT^2;
h = 20.0; % m
r0 = [0 h];
v0value = 20.0;
alphalist = [30 40 45 50 60];
for alpha = alphalist
    v0 = v0value*[cos(alpha*pi/180.0) sin(alpha*pi/180.0)];
    time = 20.0; % s
    % Variables
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
        Fnet = -D*norm(v(i,:))*v(i,:) - m*g*[0 1];
        a = Fnet/m;
        v(i+1,:) = v(i,:) + dt*a;
        r(i+1,:) = r(i,:) + dt*v(i+1,:);
        t(i+1) = t(i) + dt;
        i = i + 1;
    end
    symb = '-b';
    if alpha==45
        symb = '-r';
    end
    plot(r(1:i,1),r(1:i,2),symb);
    xlabel('x [m]');
    ylabel('y [m]');
    hold on
end
hold off
axis([0 40 0 35])