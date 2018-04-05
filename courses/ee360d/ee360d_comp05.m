%% Exercise 1

% Do not uncomment the following line. It is not a Matlab command.
% H(z) = (1 - rcos(w0)z^(-1))/(1 - 2rcos(w0)z^(-1) + (r^2)z^(-2))
%      = (z^2 - rcos(w0)z)/(z^2 - 2rcos(w0)z + r^2)
% We will refer to these two expressions as Form I and Form II, respectively.

%% Exercise 2

close all;

a = 0.9;
w0 = pi/7;
r = 1; % This value was missing from the assignment.

% Define H(z) in Form I (see solution to Exercise 1 above).
numerator = [1, -r*cos(w0)];
denominator = [1, -2*r*cos(w0), r^2];

% In order to use polyval(), we must convert H(z) to Form II.
[c, d] = eqtflength(numerator, denominator);

% Use polyval() to calculate H(z) for -2<Re{s}<2 and -2<Im{s}<2.
[re, im] = meshgrid(-2:0.1:2);
z = re + j*im;
H = polyval(c, z)./polyval(d, z);

% Plot magnitude of H(z)
figure(1);
meshc(re, im, 20*log10(abs(H)));
xlabel('Re\{z\}');
ylabel('Im\{z\}');
title('20 log_{10}|H(z)|');

%% Exercise 3

w = -2*pi:0.1:2*pi;
H = freqz(numerator, denominator, w);

figure(2);
subplot(2, 1, 1);
plot(w, 20*log10(abs(H)));
xlabel('\omega');
ylabel('20 log_{10}|H(e^{j\omega})|');
subplot(2, 1, 2);
plot(w, angle(H));
xlabel('\omega');
ylabel('\angle H(e^{j\omega})');
title('Frequency response H(e^{j\omega})');

%% Excercise 4

zeros = roots(numerator)
poles = roots(denominator)

numerator = poly(zeros)
denominator = poly(poles)

%% Exercise 5

% Zero-pole plot of H(z)
figure(3);
zplane(zeros, poles);
grid on;
% Note: The inputs of zplane() were taken from Form I.
%   If (zeros, poles) had been calculated from Form II instead,
%   then zplane() would plot an extra zero at z = 0.

%% Exercise 6

[r, p, k] = residuez(numerator, denominator);

n = (0:50)';

% When H(z) has no repeated roots and 
%   has partial fractions of the form
%   A/(1 - az^(-1)),
%   then each term of h[n] has the form
%   A(a^n).
% So, the following expression is the 
%   inverse z-transform of H(z).
h = [p(1).^n, p(2).^n]*r;
% Recall that r is a column vector (by convention).
% Also, note that there are only 2 poles because
%   the denominator of H(z) is a polynomial of order 2.

figure(4);
stem(n, h);
xlabel('time');
ylabel('h[n]');
title('Impulse response');

%% Exercise 7

% If x[n] = u[n], then X(z) = 1/(1 - z^(-1)), and Y(z) = H(z)/(1 - z^(-1)).
% So, to generate Y(z), multiply the denominator of H(z) by (1 - z^(-1)).
% Recall that polynomial multiplication is implemented via conv().
% Note that the polynomial '(1 - z^(-1))' is 
%   expressed as its coefficients: [1, -1].
denominator = conv(denominator, [1, -1]);

% Partial fraction expansion of Y(z)
[r, p, k] = residuez(numerator, denominator)

% Step response is the inverse z-transform of the Y(z) computed above.
y = [p(1).^n, p(2).^n, p(3).^n]*r;
% Note that Y(z) has 3 poles because H(z) has 2 poles and X(z) has 1.

figure(5);
stem(n, y);
xlabel('time');
ylabel('y[n]');
title('Step response');