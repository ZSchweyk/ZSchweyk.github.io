%% Exercise 1

% The assignment requests explicitly typed definitions,
% so zeros(), ones(), and colons have been avoided here.
delta = [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
u = [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1];
r = [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5];
x = [0, 1, 2, 3, 2, 1, 0, -1, -2, -3, -2];
y = [-1, 0, 1, 2, 3, 2, 1, 0, -1, -2, -3];
figure(1);
stem(r, delta);
figure(2);
stem(r, u);
figure(3);
stem(r, r);
figure(4);
stem(r, x);
figure(5);
stem(r, y);

%% Exercise 2

v = [x, y];
figure(6);
stem(v); % Time axis is unimportant. Simply show periodicity of the signal.
r(3) % Exclude the semicolon to print the value.
x(3)
y(3)

%% Exercise 3

c = fliplr(u);
d = x + y;
e = x - y;
f = 2*x.*delta;
g = 2*r.*c;
figure(7);
stem(r, c);
figure(8);
stem(r, d);
figure(9);
stem(r, e);
figure(10);
stem(r, f);
figure(11);
stem(r, g);

%% Exercise 4

n = -25:25;
delta = [zeros(1, 25), 1, zeros(1, 25)];
u = [zeros(1, 25), ones(1, 26)];
x = (5/6).^n;
y = (-5/6).^n;
z = cos((pi/5).*n);
f = cos((11*pi/5).*n);
figure(12);
stem(n, delta);
figure(13);
stem(n, u);
figure(14);
stem(n, x);
figure(15);
stem(n, y);
figure(16);
stem(n, z);
figure(17);
stem(n, f);

%% Exercise 5

% Typo: "... generated in Exercise 3..." should read 
%       "... generated in Exercise 4...".
% However, the specific signals used are unimportant.
% Simply demonstrate the expressions.

c = z - f;
d = x; % Time-scaling and time-shifting will be done within stem().
e = u;
g = fliplr(u);
h = x;
figure(18);
stem(n, c);
figure(19);
stem(2.*n, d);
figure(20);
stem(n - 5, e);
figure(21);
stem(n, g);
figure(22);
stem(-2.*n + 1, h);

%% Exercise 6

r = exp((j*pi/5).*n);
figure(23);
stem(n, r);