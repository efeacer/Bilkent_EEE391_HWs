% EEE391 Computer Assignment 2
% Author: EFE ACER

%% a) 

offset = 101;
x1 = zeros(1, 201);
for n = -100:100
    if n >= 0 && n <= 19
        x1(n + offset) = 1;
    elseif n >= 20 && n <= 39
        x1(n + offset) = 5;
    end
end
n_x1 = 0;

figure(1);
stem(-100:100, x1, 'filled');
xlim([-10, 50]);
title('a) x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

x2 = zeros(1, 201);
for n = -100:100
    if abs(n) <= 5
        x2(n + offset) = abs(n);
    end
end
n_x2 = -5;

figure(2);
stem(-100:100, x2, 'filled');
xlim([-10, 10]);
title('a) x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x1);
[z, n_z] = convolve(x1, x1, n_x1, n_x1);
figure(3);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-20, 100])
title('a) x_1[n] * x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x2, x2);
[z, n_z] = convolve(x2, x2, n_x2, n_x2);
figure(4);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-20, 20])
title('a) x_2[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x2);
[z, n_z] = convolve(x1, x2, n_x1, n_x2);
figure(5);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-20, 50])
title('a) x_1[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%% b)

x1 = zeros(1, 201);
for n = -100:100
    if -2 * n + 4 >= 0
        x1(n + offset) = x1(n + offset) + 1;
    end
    if -n - 3 >= 0
        x1(n + offset) = x1(n + offset) - 1;
    end
end
n_x1 = -2;

figure(6);
stem(-100:100, x1, 'filled');
xlim([-5, 5])
title('b) x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

x2 = zeros(1, 201);
for n = -100:100
    if -n - 10 == 0
        x2(n + offset) = 7;
    elseif -n + 10 == 0
        x2(n + offset) = -14;
    end
end
n_x2 = -10;

figure(7);
stem(-100:100, x2, 'filled');
xlim([-15, 15])
title('b) x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x1);
[z, n_z] = convolve(x1, x1, n_x1, n_x1);
figure(8);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-10, 10])
title('b) x_1[n] * x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x2, x2);
[z, n_z] = convolve(x2, x2, n_x2, n_x2);
figure(9);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-30, 30])
title('b) x_2[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x2);
[z, n_z] = convolve(x1, x2, n_x1, n_x2);
figure(10);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-20, 20])
title('b) x_1[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%% c)

x1 = zeros(1, 201);
for n = -100:100
    if abs(n) <= 25
        x1(n + offset) = 10 * exp(-abs(n));
    end
end
n_x1 = -25;

figure(11);
stem(-100:100, x1, 'filled');
xlim([-30,  30])
title('c) x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

x2 = zeros(1, 201);
for n = -100:100
    if n + 3 == 0
        x2(n + offset) = 4;
    elseif n == 0
        x2(n + offset) = -8;
    elseif n - 3 == 0
        x2(n + offset) = 4;
    end
end
n_x2 = -3;

figure(12);
stem(-100:100, x2, 'filled');
xlim([-10, 10])
title('c) x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x1);
[z, n_z] = convolve(x1, x1, n_x1, n_x1);
figure(13);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-60, 60])
title('c) x_1[n] * x_1[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x2, x2);
[z, n_z] = convolve(x2, x2, n_x2, n_x2);
figure(14);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-20, 20])
title('c) x_2[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%z = conv(x1, x2);
[z, n_z] = convolve(x1, x2, n_x1, n_x2);
figure(15);
idx = find(z ~= 0, 1, 'first');
time_vals = (1:length(z)) - (idx - n_z);
stem(time_vals, z, 'filled');
xlim([-30, 30])
title('c) x_1[n] * x_2[n]');
xlabel('n: Sample number');
ylabel('A: Amplitude');

%% Discrete Convolution Sum Implementation:

function [z, n_z] = convolve(x, y, n_x, n_y)
% CONVOLVE Computes the discrete convolution sum of two finite supported
% sequences x and y. n_x and n_y denotes the first time indices of the 
% sequences which correspond to nonzero values. z returns the convolution
% result and n_z denotes the first time index of z's support.
    z = zeros(1, length(x) + length(y) - 1);
    for i = 1:length(x)
        for j = 1:length(y)
            z(i + j - 1)= z(i + j - 1) + x(i) * y(j);
        end
    end
    n_z = n_x + n_y;
end    