clear all; clf;
R = 0.02; % m
mA = 0.1; % kg
mB = 0.1; % kg
rA0 = [-0.06 0.0]; % m
vA0 = [1.0 0.0]; % m/s
rB0 = [0.0 0.018]; % m
vB0 = [0.0 0.0]; % m/s
time = 0.1; % s
% Force model
eta = 1.0; % 
k = 2000000.0; % Nm
dt = 0.0001; % s
% Initialization
n = ceil(time/dt);
t = zeros(n,1);
rA = zeros(n,2);
vA = zeros(n,2);
rB = zeros(n,2);
vB = zeros(n,2);
F = zeros(n,2);
rA(1,:) = rA0;
vA(1,:) = vA0;
rB(1,:) = rB0;
vB(1,:) = vB0;
D = 2*R; % Diameter
% Integration loop
for i = 1:n-1
    Deltar = rB(i,:)-rA(i,:);
    Deltarnorm = norm(Deltar);
    Deltav = vB(i,:)-vA(i,:);
    if (Deltarnorm>=D)
        Fnet = [0 0];
    else
        Fnet = -k*abs(Deltarnorm-D)^1.5...
            *Deltar/Deltarnorm + eta*Deltav;
    end
    F(i,:) = Fnet;
    aA = Fnet/mA;
    aB = -Fnet/mB;
    vA(i+1,:) = vA(i,:) + aA*dt;
    rA(i+1,:) = rA(i,:) + vA(i+1,:)*dt;
    vB(i+1,:) = vB(i,:) + aB*dt;
    rB(i+1,:) = rB(i,:) + vB(i+1,:)*dt;
    t(i+1) = t(i) + dt;
end
% Plot trajectories
figure(1);
plot(rA(:,1),rA(:,2),'-b',rB(:,1),rB(:,2),'-r');
xlabel('x [m]');
ylabel('y [m]');
axis equal
% Animate by drawing
figure(2)
xmin = min([min(rA(:,1)-R) min(rB(:,1)-R)]);
xmax = max([max(rA(:,1)+R) max(rB(:,1)+R)]);
ymin = min([min(rA(:,2)-R) min(rB(:,2)-R)]);
ymax = max([max(rA(:,2)+R) max(rB(:,2)+R)]);
for j = 1:30
	i = ceil(j*n/30);
    plot(rA(:,1),rA(:,2),'-b',rB(:,1),rB(:,2),'-r',...
        rA(i,1),rA(i,2),'ob',rB(i,1),rB(i,2),'or');
    xlabel('x [m]');
    ylabel('y [m]');
    axis equal
    axis([xmin xmax ymin ymax]);
    rectangle('Position',[rA(i,1)-R rA(i,2)-R D D],'Curvature',[1 1],'EdgeColor','blue');
    rectangle('Position',[rB(i,1)-R rB(i,2)-R D D],'Curvature',[1 1],'EdgeColor','red');
    drawnow
end
