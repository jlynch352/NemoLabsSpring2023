% File: ScaledVsUnscaled.m
% Script to test pm_unscaled and plot P vs. M over time

%% Time spans
tspan_unscaled = [0, 10];    % actual time units
tspan_scaled   = [0, 10];    % dimensionless time


%% Scaled

% Unscaled Parameters
par_Unscaled.delta = 4;
par_Unscaled.sigma  = 0.4;
par_Unscaled.mu     = 0.3;
par_Unscaled.alpha  = 0.35;
par_Unscaled.beta   = 1000;

% Initial conditions 
p0_Unscaled = 20;  
g0_Uncaled = 20;  

IC_Unscaled = [p0_Unscaled, g0_Uncaled];

% Solve
[t_unscaled, P_unscaled, G_unscaled] = pg_unscaled(IC_Unscaled, tspan_unscaled, par_Unscaled);

% Plot unscaled
figure;

subplot(2,1,1);

plot(t_unscaled, P_unscaled, 'r-',  'LineWidth',1.5); 
hold on;
plot(t_unscaled, G_unscaled, 'b--', 'LineWidth',1.5);
xlabel('Time T');
ylabel('Population');
legend('Pathogen P','Generalist G','Location','Best');
title('Unscaled Pathogen–Generalist');
grid on;

%% Scaled

%% Scaled Parameters
par_Scaled.r = 2;    % scaled growth rate
par_Scaled.b = 0.5;  % scaled kill rate
par_Scaled.m = 2.0;  % scaled interaction coefficient

% Initial conditions for Scaled
p0_Scaled = 0.3;   
g0_Uncaled = 0.1;   
IC_Scaled = [p0_Scaled, g0_Uncaled];

% Solve
[t_sc, p_sc, g_sc] = pg_scaled(IC_Scaled, tspan_scaled, par_Scaled);

% Plot scaled
subplot(2,1,2);

plot(t_sc, p_sc, 'r-',  'LineWidth',1.5); hold on;
plot(t_sc, g_sc, 'b--', 'LineWidth',1.5);
xlabel('Dimensionless time t');
ylabel('Fraction');
legend('Pathogen p','Generalist g','Location','Best');
title('Scaled Pathogen–Generalist');
grid on;
