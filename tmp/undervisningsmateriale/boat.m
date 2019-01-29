clear all; clf;
load -ascii boatvelocity.d
t = boatvelocity(:,1);
n = length(t);
dt = t(2)-t(1);
v = zeros(n,2);
v(:,1) = boatvelocity(:,2);
v(:,2) = boatvelocity(:,3);
r = zeros(n,2);
r(1,:) = [0.0 0.0];
for i = 1:n-1
  r(i+1,:) = r(i,:) + v(i,:)*dt;
end
figure(1);
plot(r(:,1),r(:,2));
axis equal
xlabel('x [m]');
ylabel('y [m]');
%
hold on
ddt = 2.0;
it = round(ddt/dt);
i = (1:it:n);
plot(r(i,1),r(i,2),'o')
hold off
