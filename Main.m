%% Run through different lambda values
lambda = [0.2, 0.4, 0.5, 0.6, 0.65, 0.7, 0.72, 0.74, 0.745];

for i = 1:9
    temp = queueSim(lambda(i), 10^6);
    disp(lambda(i))
    disp(temp);
end

%% Compare Theoretiacal to Simulated
Qdelay = [0.4581, 0.7097, 1.0043, 1.6801, 2.4944, 4.7645, 8.3769, 23.0386, 46.3229];
theoQdelay = [];

for i = 1:9
    theoQdelay(i) = 0.25/(0.75 - lambda(i));
end

figure;
plot(lambda, Qdelay);
xlim([0.2 0.745]);
xlabel('Arrival Rate (λ)');
ylabel('Expected Queueing Delay');
title('Simulated Expected Queueing Delay');

figure;
plot(lambda, theoQdelay);
xlim([0.2 0.745]);
xlabel('Arrival Rate (λ)');
ylabel('Expected Queueing Delay');
title('Theoretical Expected Queueing Delay');

figure;
hold on;
plot(lambda, Qdelay);
plot(lambda, theoQdelay);
xlim([0.2 0.745]);
xlabel('Arrival Rate (λ)');
ylabel('Expected Queueing Delay');
title('Theoretical vs Simulated Expected Queueing Delay');
