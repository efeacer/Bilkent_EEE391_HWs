%% QUESTION 1
% Author: EFE ACER

load('data.mat');

%% PART A

[NUM_SIGNALS, NUM_SAMPLES] = size(X);

SAMPLING_RATE = 1000; % Hz
SAMPLING_INTERVAL = 1 / SAMPLING_RATE; % sec

% Get the signals corresponding to the last three digits of my ID
signal2 = X(2, :);
signal1 = X(1, :);
signal7 = X(7, :);

% Populate the time values 
t = (0: NUM_SAMPLES - 1) * SAMPLING_INTERVAL;

% Plot the signals
figure(1);
plot(t, signal2);
title('x_2(t) versus t');
xlabel('t: Time (sec)');
ylabel('A: Amplitude');

figure(2);
plot(t, signal1);
title('x_1(t) versus t');
xlabel('t: Time (sec)');
ylabel('A: Amplitude');

figure(3);
plot(t, signal7);
title('x_7(t) versus t');
xlabel('t: Time (sec)');
ylabel('A: Amplitude');

%% PART C
fprintf('Signal 2: ');
print_signal(SAMPLING_RATE, signal2);
fprintf('Signal 1: ');
print_signal(SAMPLING_RATE, signal1);
fprintf('Signal 7: ');
print_signal(SAMPLING_RATE, signal7);

function [C, A, f, phi] = parameters_of_sin(fs, x)
% PARAMETERS_OF_SIN estimates the DC component, amplitude, frequency
% (in Hz) and phase shift (in degrees) of a sinusoidal signal, given the
% sampling rate, fs, and the uniform sample values, x. 
    min_val = min(x);
    max_val = max(x);
    C = (min_val + max_val) / 2;
    A = max_val - C;
    first_pos_peak_idx = find(x > C + A - A / 1000, 1);
    first_neg_peak_idx = find(x < C - A + A / 1000, 1);
    samples_in_a_period = 2 * abs(first_pos_peak_idx - first_neg_peak_idx);
    f = fs / samples_in_a_period;
    phi = mod(first_pos_peak_idx / fs * 180 / pi, 360);
end

function print_signal(fs, x)
% PRINT_SIGNAL estimates and prints the analytical form of the
% continuos-time sinusoidal signal (with radian argument) corresponding to 
% the given uniform samples, x, sampled with rate, fs.
    [C, A, f, phi] = parameters_of_sin(fs, x);
    w_radians = 2 * pi * f;
    phi_radians = phi * pi / 180;
    fprintf('%.2f + %.2f cos(%.2f t + %.2f)\n', C, A, w_radians, phi_radians);
end