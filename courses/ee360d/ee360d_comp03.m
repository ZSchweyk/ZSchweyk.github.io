%% Exercise 1

M = 4;
w = -pi:0.1:pi;
H = (sin(w.*(M + 1/2)))./(sin(w./2));

close all;
figure(1)
plot(w, H);

xlim([-pi, pi])
xlabel('\omega');
ylabel('H(\omega)');

%% Exercise 2

% Generate 100 samples
n = 0:99;

h = (1/(M + 1))*ones(1, M);

x0 = cos(pi*n/10);
x1 = cos(pi*n);
x2 = x0 + x1;

y0 = conv(x0, h, 'same');
y1 = conv(x1, h, 'same');
y2 = conv(x2, h, 'same');

figure(2)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 3

x0 = x0 + randn(size(n));
x1 = x1 + randn(size(n));
x2 = x2 + randn(size(n));

y0 = conv(x0, h, 'same');
y1 = conv(x1, h, 'same');
y2 = conv(x2, h, 'same');

figure(3)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 4

x0 = cos(pi*n/10);
x1 = cos(pi*n);
x2 = x0 + x1;

y0 = filter(h, 1, x0);
y1 = filter(h, 1, x1);
y2 = filter(h, 1, x2);

figure(4)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 5

x0 = x0 + randn(size(n));
x1 = x1 + randn(size(n));
x2 = x2 + randn(size(n));

y0 = filter(h, 1, x0);
y1 = filter(h, 1, x1);
y2 = filter(h, 1, x2);

figure(5)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 6

H = 1 - exp(-i*w);

figure(6)
plot(w, abs(H));

xlim([-pi, pi])
xlabel('\omega');
ylabel('H(\omega)');

%% Exercise 7

% Increase the number of samples to 400
% to highlight the effect of the high-pass filter.
% We will observe that the filter
% removes the large-scale curvature of signals
% (i.e., low-frequency components),
% while retaining the small-scale fluctuations
% (i.e., high-frequency components).
n = 0:399;

% h[n] = {1 for n = 0}
%        {-1 for n = -1}
%        {0 otherwise}
h = [1, -1];

x0 = cos(pi*n/10);
x1 = cos(pi*n);
x2 = x0 + x1;

y0 = conv(x0, h, 'same');
y1 = conv(x1, h, 'same');
y2 = conv(x2, h, 'same');

figure(7)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 8

x0 = x0 + randn(size(n));
x1 = x1 + randn(size(n));
x2 = x2 + randn(size(n));

y0 = conv(x0, h, 'same');
y1 = conv(x1, h, 'same');
y2 = conv(x2, h, 'same');

figure(8)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 9

x0 = cos(pi*n/10);
x1 = cos(pi*n);
x2 = x0 + x1;

y0 = filter(h, 1, x0);
y1 = filter(h, 1, x1);
y2 = filter(h, 1, x2);

figure(9)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');

%% Exercise 10

x0 = x0 + randn(size(n));
x1 = x1 + randn(size(n));
x2 = x2 + randn(size(n));

y0 = filter(h, 1, x0);
y1 = filter(h, 1, x1);
y2 = filter(h, 1, x2);

figure(10)

subplot(3, 1, 1)
plot(n, x0, n, y0);
legend('x0[n]', 'y0[n]');
xlabel('n');

subplot(3, 1, 2)
plot(n, x1, n, y1);
legend('x1[n]', 'y1[n]');
xlabel('n');

subplot(3, 1, 3)
plot(n, x2, n, y2);
legend('x2[n]', 'y2[n]');
xlabel('n');
