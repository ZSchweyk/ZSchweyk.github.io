close all;
a0 = 1;
a1 = -0.18902544;
a2 = 0.71974192;
a3 = -0.15739157;
b0 = 0.25445939;
b1 = 0.43220307;
b2 = b1;
b3 = b0;

% Direct Form II
A = [0, 1, 0; 0, 0, 1; -a3, -a2, -a1];
B = [0; 0; 1];
C = [-a3*b0+b3, -a2*b0+b2, -a1*b0+b1];
D = b0;

time = [0:50];
y = zeros(51, 1);

%% Exercise 3a

x = [1, zeros(1, 50)];

% Initialize q
q = zeros(3, 1);

for n = 1:51
    y(n) = C*q + D*x(n);
    q = A*q + B*x(n);
end

figure(1)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = \delta[n]')
subplot(2, 1, 2)
stem(time, y)
title('y[n]')

%% Exercise 3b

x = ones(1, 51);

% Initialize q
q = zeros(3, 1);

for n = 1:51
    y(n) = C*q + D*x(n);
    q = A*q + B*x(n);
end

figure(2)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = u[n]')
subplot(2, 1, 2)
stem(time, y)
title('y[n]')

%% Exercise 3c

x = cos(0.2*pi*time);

% Initialize q
q = zeros(3, 1);

for n = 1:51
    y(n) = C*q + D*x(n);
    q = A*q + B*x(n);
end

figure(3)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = cos[0.2\pi n]u[n]')
subplot(2, 1, 2)
stem(time, y)
title('y[n]')

%% Exercise 3d

x = cos(0.2*pi*time) + cos(0.7*pi*time);

% Initialize q
q = zeros(3, 1);

for n = 1:51
    y(n) = C*q + D*x(n);
    q = A*q + B*x(n);
end

figure(4)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = cos[0.2\pi n]u[n] + cos[0.7\pi n]u[n]')
subplot(2, 1, 2)
stem(time, y)
title('y[n]')

%% Exercise 4a

sys = ss(A, B, C, D, 1);

x = [1, zeros(1, 50)];

[y, n] = impulse(sys, 50);

figure(5)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = \delta[n]')
subplot(2, 1, 2)
stem(n, y)
title('y[n]')

%% Exercise 4b

x = ones(1, 51);

[y, n] = step(sys, 50);

figure(6)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = u[n]')
subplot(2, 1, 2)
stem(n, y)
title('y[n]')

%% Exercise 4c

x = cos(0.2*pi*time);

[y, n] = lsim(sys, x);

figure(7)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = cos[0.2\pi n]u[n]')
subplot(2, 1, 2)
stem(n, y)
title('y[n]')

%% Exercise 4d

x = cos(0.2*pi*time) + cos(0.7*pi*time);

[y, n] = lsim(sys, x);

figure(8)
subplot(2, 1, 1)
stem(time, x)
title('x[n] = cos[0.2\pi n]u[n] + cos[0.7\pi n]u[n]')
subplot(2, 1, 2)
stem(n, y)
title('y[n]')
