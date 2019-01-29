load -ascii therocket.dat
t = therocket(:,1);
a = therocket(:,2);
dt = t(2) - t(1);
n = length(t);
v = zeros(n,1);
x = zeros(n,1);
for i = 1:n-1
    v(i+1) = v(i) + a(i)*dt;
    x(i+1) = x(i) + v(i)*dt;
end
subplot(3,1,1)
plot(t,x)
xlabel('t [s]');
ylabel('x [m]');
subplot(3,1,2)
plot(t,v)
xlabel('t [s]');
ylabel('v [m/s]');
subplot(3,1,3)
plot(t,a)
xlabel('t [s]');
ylabel('a [m/s^2]');