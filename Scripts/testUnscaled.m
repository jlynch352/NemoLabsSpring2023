% File: testUnscaled.m
% Script to test pm_unscaled and plot P vs. M over time

%% parameters

%pathogens
par.alpha = 0.4;    
par.beta = 300;

%macrophages
par.delta = 9;
par.sigma = 0.2;

%both
par.mu = 0.3;

%% initial conditions and time span
% initial pathogen
P0 = 10;   
% initial macrophage
M0 = 6;
IC = [P0, M0];

% initial time
interval = [0, 50];  

% run
[t,P,M] = pg_unscaled(IC, interval, par);

% plot
figure;
plot(t, P, 'r-', 'LineWidth',1.5); 
hold on
plot(t, M, 'b-', 'LineWidth',1.5);
xlabel('Time');
ylabel('Population');
legend('Pathogen (P)','Macrophage (M)','Location','Best');
title('Unscaled Pathogen–Macrophage Dynamics');
grid on;
