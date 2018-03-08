%% Exercise 1

% Do not uncomment the following line. It is not a Matlab command.
% H(s) = (s + a)/(s^2 + 2as + a^2 + w0^2)

%% Exercise 2

close all;
a = 1.5;
w0 = 7;

% Calculate H(s) for -10<Re{s}<10 and -10<Im{s}<10
[re, im] = meshgrid(-10:0.1:10);
s = re + j*im;
numerator = [1, a];
denominator = [1, 2*a, a^2+w0^2];
H = polyval(numerator, s)./polyval(denominator, s);

% Plot magnitude of H(s)
figure(1);
meshc(re, im, 20*log10(abs(H)));
xlabel('Re\{s\}');
ylabel('Im\{s\}');
title('20 log_{10}|H(s)|');

%% Exercise 3

w = -10:0.1:10;
H = freqs(numerator, denominator, w);

figure(2);
subplot(2, 1, 1);
plot(w, 20*log10(abs(H)));
xlabel('\omega');
ylabel('20 log_{10}|H(j\omega)|');
subplot(2, 1, 2);
plot(w, angle(H));
xlabel('\omega');
ylabel('\angle H(j\omega)');
title('Frequency response H(j\omega)');

%% Excercise 4

zeros = roots(numerator)
poles = roots(denominator)

numerator = poly(zeros)
denominator = poly(poles)

%% Exercise 5

[zeros, poles, gain] = tf2zp(numerator, denominator)
[numerator, denominator] = zp2tf(zeros, poles, gain)

%% Exercise 6

figure(3);
zplane(zeros, poles);
grid;

%% Exercise 7

[r, p, k] = residue(numerator, denominator);

t = 0:0.1:5;

% Recall that r is a column vector (by convention).
% The .' operator is non-conjugate transpose.
% For a transfer function with no repeated poles,
%   the inverse Laplace transform is a sum of exponential functions
%   whose coefficients are r and whose arguments are p*t,
%   where r and p are obtained from residue() above.
% kron(p, t) generates a matrix where
%   each row represents a value of p, and
%   each column represents a value of t.
% So, the following expression is the 
%   inverse Laplace transform of the transfer function H(s).
h = r.'*exp(kron(p, t));

figure(4);
plot(t, h);
xlabel('time');
ylabel('h(t)');
title('Impulse response');

%% Exercise 8

% If x(t) = u(t), then X(s) = 1/s, and Y(s) = H(s)/s.
% So, to generate Y(s), multiply the denominator of H(s) by s.
% Recall that polynomial multiplication is implemented via conv().
% Note that the polynomial 's' is expressed as its coefficients: [1 0].
denominator = conv(denominator, [1, 0]);

% Partial fraction expansion of Y(s) = H(s)/s
[r, p, k] = residue(numerator, denominator)

% Step response is the inverse Laplace transform of Y(s) = H(s)/s
y = r.'*exp(kron(p, t));

figure(5);
plot(t, y);
xlabel('time');
ylabel('y(t)');
title('Step response');
