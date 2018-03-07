%% Exercise 2

close all;
time = -3:51;

% Plot inputs
figure(1);

xa = [zeros(1, 3), 1, zeros(1, 51)];
xb = [zeros(1, 3), ones(1, 52)];
xc = cos(0.2*pi*time) .* xb;
xd = (cos(0.2*pi*time) + cos(0.7*pi*time)).*xb;

subplot(2, 2, 1);
stem(time, xa);
title('Part (a)');
subplot(2, 2, 2);
stem(time, xb);
title('Part (b)');
subplot(2, 2, 3);
stem(time, xc);
title('Part (c)');
subplot(2, 2, 4);
stem(time, xd);
title('Part (d)');

% Plot outputs
figure(2);

a0 = 1;
a1 = -0.18902544;
a2 = 0.71974192;
a3 = -0.15739157;
b0 = 0.25445939;
b1 = 0.43220307;
b2 = b1;
b3 = b0;

x = xa;
y = zeros(1, 55);

for n = 4:55
    y(n) = -a1*y(n-1) - a2*y(n-2) - a3*y(n-3) + ...
                b0*x(n) + b1*x(n-1) + b2*x(n-2) + b3*x(n-3);
end

subplot(2, 2, 1);
stem(time, y);
title('Part (a)');

x = xb;
y = zeros(1, 55);

for n = 4:55
    y(n) = -a1*y(n-1) - a2*y(n-2) - a3*y(n-3) + ...
                b0*x(n) + b1*x(n-1) + b2*x(n-2) + b3*x(n-3);
end

subplot(2, 2, 2);
stem(time, y);
title('Part (b)');

x = xc;
y = zeros(1, 55);

for n = 4:55
    y(n) = -a1*y(n-1) - a2*y(n-2) - a3*y(n-3) + ...
                b0*x(n) + b1*x(n-1) + b2*x(n-2) + b3*x(n-3);
end

subplot(2, 2, 3);
stem(time, y);
title('Part (c)');

x = xd;
y = zeros(1, 55);

for n = 4:55
    y(n) = -a1*y(n-1) - a2*y(n-2) - a3*y(n-3) + ...
                b0*x(n) + b1*x(n-1) + b2*x(n-2) + b3*x(n-3);
end

subplot(2, 2, 4);
stem(time, y);
title('Part (d)');


%% Exercise 3

% Plot filter() outputs
figure(3);

a = [a0, a1, a2, a3];
b = [b0, b1, b2, b3];

y = filter(b, a, xa);
subplot(2, 2, 1);
stem(time, y);
title('Part (a)');

y = filter(b, a, xb);
subplot(2, 2, 2);
stem(time, y);
title('Part (b)');

y = filter(b, a, xc);
subplot(2, 2, 3);
stem(time, y);
title('Part (c)');

y = filter(b, a, xd);
subplot(2, 2, 4);
stem(time, y);
title('Part (d)');


%% Exercise 4

% Plot conv() outputs
figure(4);

h = [-.0756867, -0.0623695, 0.09354893, 0.30273069, ...
        0.4, 0.30273069, 0.09354893, -0.06236595, -0.07568267];

y = conv(xa, h, 'same');
subplot(2, 2, 1);
stem(time, y);
title('Part (a)');

y = conv(xb, h, 'same');
subplot(2, 2, 2);
stem(time, y);
title('Part (b)');

y = conv(xc, h, 'same');
subplot(2, 2, 3);
stem(time, y);
title('Part (c)');

y = conv(xd, h, 'same');
subplot(2, 2, 4);
stem(time, y);
title('Part (d)');