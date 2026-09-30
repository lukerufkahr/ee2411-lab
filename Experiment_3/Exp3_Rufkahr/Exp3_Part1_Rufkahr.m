%{
        Lucas Rufkahr
        EE 2411, Lab 3
        9/21/2026
%}

clc;
clearvars;
close all;

%% Step 1
T = 0:10;
T==5

%% Step 2
% See unitStep.m

%% Step 3
t = linspace(-2,4,1000);
x =  exp(-2 * t) .* (unitStep(t) - unitStep(t - 1));
plot(t,x);
title('Decaying exponential with a step function');
xlabel('t [-2,4]');
ylabel('x(t)');
exportgraphics(gcf, 'part1_step3.png', Units="pixels", ...
    Width=800,Height=600,Padding=10);

%% Step 4
hold on;
x_shift =  exp(-2 * (t - 1.5)) .* (unitStep(t - 1.5) - unitStep((t - 1.5) - 1));
plot(t,x_shift);

x_compressed =  exp(-2 * (2 * t)) .* (unitStep(2 * t) - unitStep((2 * t) - 1));
plot(t, x_compressed);

x_reversed =  exp(-2 * (-1 * t)) .* (unitStep(-1 * t) - unitStep((-1 * t) - 1));
plot(t, x_reversed);

legend( ...
    'Exponential signal', ...
    'Shifted signal', ...
    'Scaled signal', ...
    'Reversed signal');

exportgraphics(gcf, 'part1_step4.png', Units="pixels", ...
    Width=800,Height=600,Padding=10);


energy_x = trapz(t, abs(x).^2);
energy_shift = trapz(t, abs(x_shift).^2);
energy_compressed = trapz(t, abs(x_compressed).^2);

disp(['Exponential Energy:' num2str(energy_x)]);
disp(['Shifted Energy:' num2str(energy_shift)]);
disp(['Compressed Energy: ' num2str(energy_compressed)]);

t_1 = -2:1:4;
x_low_resolution =  exp(-2 * t_1) .* (unitStep(t_1) - unitStep(t_1 - 1));
trapz(t_1, abs(x_low_resolution).^2)

%% Step 5 part a
figure();

%% Step 5 part b
subplot(2,2,1);
plot(t,x);
title('x(t) over time');
xlabel('t');
ylabel('x(t)');

subplot(2,2,2);
plot(t, x_shift);
title('x(t - 1.5) over time');
xlabel('t');
ylabel('x(t - 1.5)');


subplot(2,2,3);
plot(t, x_compressed);
title('x(2t) over time');
xlabel('t');
ylabel('x(2t)');


subplot(2,2,4);
plot(t, x_reversed);
title('x(-t) over time');
xlabel('t');
ylabel('x(-t)');

exportgraphics(gcf, 'part1_step5.png', Units="pixels", ...
    Width=800,Height=600,Padding=10);

subplot(2,2,1);
xlim([0 1]);
grid on;

subplot(2,2,2);
xlim([1.5 2.5]);
grid on;

subplot(2,2,3);
xlim([0, 0.5]);
grid on;

subplot(2,2,4);
xlim([-1 0]);
grid on;

exportgraphics(gcf, 'part1_step5_grid.png', Units="pixels", ...
    Width=800,Height=600,Padding=10);

%% Step 6 part a
freq_samp = 44100;

%% Step 6 part b
T_samp = 1/freq_samp;
t = 0:T_samp:4;

%% Step 6 part c
freq_0 = 20; % HZ
freq_1 = 200; % HZ
beta = (freq_1 - freq_0) / max(t);
y = sin(2 * pi * (freq_0 * t + 0.5 * beta * t.^2));
figure();
plot(t,y);
xlim([0 2]);
ylim([-1.5 1.5]);
exportgraphics(gcf, 'part1_step6.png', Units="pixels", ...
    Width=800,Height=600,Padding=10);
%% Step 6 part d
soundsc(y, freq_samp);

%% Step 6 part e
y_reversed = fliplr(y);
soundsc(y_reversed, freq_samp);

%% Step 6 part f
t_compressed = 2 * t;
t = t_compressed;
y_compressed = sin(2 * pi * (freq_0 * t + 0.5 * beta * t.^2));
soundsc(y_compressed, freq_samp);

t_stretch = t / 2;
t = t_stretch;
y_stretch = sin(2 * pi * (freq_0 * t + 0.5 * beta * t.^2));
soundsc(y_stretch, freq_samp);

%% Step 6 part g
fall_rise = [y_reversed, y];
soundsc(fall_rise, freq_samp);
