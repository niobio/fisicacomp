clf;
g = 9.8; % m/s^2
R= 0.02; % m
m = 0.1; % kg
y0 = 0.021; % m
v0 = -3.0; % m/s
k = 1000000.0;
for eta = [0.0 3000.0]
	time = 0.005;
	dt = 0.00001;
	n = ceil(time/dt);
	t = zeros(n,1);
	y = zeros(n,1);
	v = zeros(n,1);
	Fnet = zeros(n,1);
	y(1) = y0;
	v(1) = v0;
	for i = 1:n-1
		dy = R-y(i);
		if (dy<=0.0)
			N = 0.0;
		else
			N = k*dy^1.5-eta*v(i)*dy;
		end
		Fnet(i) = N - m*g;
		a = Fnet(i)/m;
		v(i+1) = v(i) + a*dt;
		y(i+1) = y(i) + v(i+1)*dt;
		t(i+1) = t(i) + dt;
	end
	subplot(2,1,1)
	hold('on');
	if(eta>0)
		plot(t,Fnet,'-r');
	else
		plot(t,Fnet,'-b');
	end
	xlabel('t [s]');
	ylabel('F [N]');
	subplot(2,1,2)
	hold('on');
	p = m*v;
	if(eta>0)
		plot(t,p,'-r');
	else
		plot(t,p);
	end
	xlabel('t [s]');
	ylabel('p [kg m/s]');
	p(n)-p(1)
end