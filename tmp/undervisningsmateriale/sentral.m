clear all;
clf;
C = -1.0;
m = 1.0;
time = 50.0;
dt = 0.001;
vv0y = [0.25 0.5 0.6 1.0];
for v0y = vv0y
    v0 = [0.0 v0y];
    r0 = [4.0 0.0];
    n = ceil(time/dt);
    r = zeros(n,2);
    v = zeros(n,2);
    t = zeros(n,1);
    r(1,:) = r0;
    v(1,:) = v0;
    for i = 1:n-1
        rr3 = norm(r(i,:))^3;
        F = C*r(i,:)/rr3;
        a = F/m;
        v(i+1,:) = v(i,:) + a*dt;
        r(i+1,:) = r(i,:) + v(i+1,:)*dt;
        t(i+1) = t(i) + dt;
    end
    plot(r(:,1),r(:,2))
    hold on
end
xlabel('x')
ylabel('y')
axis equal
hold off
