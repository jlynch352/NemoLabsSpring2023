% File: Nullcines.m
% Draws the Nullclines for the graph and a dividing green line where to the
% left-hand side of the green-line all endemic equilibrium are unstable
% and to the right of the green line all endemic equilibrium are stab;e


% Parameter values
a = 3;       
b = 2;    
k = 10;       

fprintf('Parameters: a = %g, b = %g, k = %g\n', a, b, k);

% Define the grid for p and m
grid_size = 10;
p_vals = linspace(0, 1, grid_size);
m_vals = linspace(0, 1, grid_size);
[P, M] = meshgrid(p_vals, m_vals);

% Compute derivatives on the grid
dP = a .* P .* (1 - P - b .* M);
dM = 1 - M - k .* M .* P;

% Prepare figure
figure; 
hold on;

% Plot vector field
quiver(P, M, dP, dM, 4, 'k', 'AutoScale', 'off');

% Nullcline curves
p_nc = linspace(0, 1.1, 300);
m_nc1 = (1 - p_nc) / b;         % dp/dt = 0
m_nc2 = 1 ./ (1 + k .* p_nc);   % dm/dt = 0
plot(p_nc, m_nc1, 'r', 'LineWidth', 2);
plot(p_nc, m_nc2, 'b', 'LineWidth', 2);

% Now add solution trajectories
tspan = [0 10];                  
% List of initial conditions [p0, m0]
initconds = [0.2 0.2; 0.8 0.2; 0.2 0.8; 0.9 0.5; 0.5 0.9; 0.1 0.9; 0.05 0.95; 0.13 .9; 0.13 0.5];
for i = 1:size(initconds,1)
    y0 = initconds(i,:);
    % sim with ode45
    [T, Y] = ode45(@(t,y)[ a*y(1)*(1 - y(1) - b*y(2)) ; 1 - y(2) - k*y(2)*y(1) ], tspan, y0);
    plot(Y(:,1), Y(:,2), 'LineWidth', 1.5);
    % mark initial point
    plot(y0(1), y0(2), 'o', 'MarkerFaceColor','k');
end

% Draw a vertical line representing where to the right of it represent the
% region where endemic equilibria are stable, visa-versa for the left side
pLine = (k-1)/(2*k);
m_space = linspace(0, 1, 100);
p_vert  = 0.5 * ones(size(m_space));
plot(p_vert, m_space, 'g-', 'LineWidth', 2);

% Labels, title, legend
xlabel('p (scaled pathogen)');
ylabel('g (scaled generalist macrophage)');
title('Phase Plane: Nullclines, Vector Field & Trajectories');
legend('Vector field', 'dp/dt=0 nullcline', 'dg/dt=0 nullcline', ...
       'Trajectories','Location','best');

axis([0 1 0 1]);
hold off;


