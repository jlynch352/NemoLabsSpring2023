% File: Nullclines_complete.m
% Plots dp/dt = 0 and dm/dt = 0 nullclines, vector‐field arrows along them,
% arrows at specified points using plot+markers, and equilibrium markers.

% Parameters
a = 3;    % pathogen growth rate
b = 2;    % macrophage scaling
k = 10;   % interaction strength

% linespace for nullclines
p_nc = linspace(0, 1.1, 300);

% Nullcline formulas
m_nc1 = (1 - p_nc) ./ b;       
m_nc2 = 1 ./ (1 + k .* p_nc);  

% Compute equilibria
disc = (k-1)^2 - 4*k*(b-1);
p_eq = [((k-1) + sqrt(disc)) / (2*k),  ((k-1) - sqrt(disc)) / (2*k)];
m_eq = (1 - p_eq) / b;

% Plots basic nullclines
figure('Color','w'); hold on; grid on;
nullcline1 = plot(p_nc, m_nc1, 'r', 'LineWidth', 2);
nullclines2 = plot(p_nc, m_nc2, 'b', 'LineWidth', 2);

% Arrow parameters
arrow_len = 0.03;
idxs = round(linspace(20, 280, 6));

% Arrows along dp/dt = 0 nullcline (vertical only)
for i = idxs
    %Gets the ordered pair
    p0 = p_nc(i);
    m0 = m_nc1(i);
    %Computes dm/dt 
    dM = 1 - m0 - k*m0*p0;
    %start and end for arrow
    y_end = m0 + sign(dM)*arrow_len;

    %based on sign arrow point either up or down
    if sign(dM) > 0
        marker_vert = '^';
    else
        marker_vert = 'v';
    end
    plot([p0, p0], [m0, y_end], '-', 'Color','r', 'LineWidth', 2, 'Marker', marker_vert, 'MarkerIndices', 2, 'MarkerSize', 10, 'MarkerFaceColor', 'r');
end

% Arrows along dm/dt = 0 nullcline (horizontal only)
for i = idxs
    p0 = p_nc(i);
    m0 = m_nc2(i);
    dP = a * p0 * (1 - p0 - b*m0);
    x_end = p0 + sign(dP)*arrow_len;
    if sign(dP) > 0
        marker_horz = '>';
    else
        marker_horz = '<';
    end
    plot([p0, x_end], [m0, m0], '-', 'Color','b', 'LineWidth', 2, 'Marker', marker_horz, 'MarkerIndices', 2, 'MarkerSize', 10,'MarkerFaceColor', 'b');
end

% Arrows at specified points 
specified_pts = [0.15, 0.15; 0.4, 0.25; 0.6, 0.6];

for j = 1:size(specified_pts,1)
    % Gets points
    p0 = specified_pts(j,1);
    m0 = specified_pts(j,2);

    % Solves for the derivative values
    dP = a * p0 * (1 - p0 - b*m0);
    dM = 1 - m0 - k*m0*p0;
    
    % vertical arrow
    y_end = m0 + sign(dM)*arrow_len;
    if sign(dM) > 0
        marker_vert = '^'; 
    else
        marker_vert = 'v';
    end
    plot([p0, p0], [m0, y_end], '-', 'Color','k', 'LineWidth',2, 'Marker',marker_vert,  'MarkerIndices',2, 'MarkerSize',10, 'MarkerFaceColor','k');
    
    % horizontal arrow
    x_end = p0 + sign(dP)*arrow_len;
    if sign(dP) > 0
        marker_horz = '>';
    else
        marker_horz = '<';
    end
    plot([p0, x_end], [m0, m0], '-',  'Color','k', 'LineWidth',2, 'Marker',marker_horz, 'MarkerIndices',2, 'MarkerSize',10,  'MarkerFaceColor','k');
end

% Plot equilibria
plot(p_eq, m_eq, 'ko', 'MarkerSize',10, 'LineWidth',1.5);

% Labels, legend, and axis
xlabel('p (pathogen fraction)',       'FontSize',12);
ylabel('m (generalist macrophages)', 'FontSize',12);
title('Nullclines with Vector-Field Arrows', 'FontSize',14);

legend([nullcline1, nullclines2], {'dp/dt = 0 nullcline','dm/dt = 0 nullcline'}, ...
       'Location','best','FontSize',11);

axis([0 1 0 1]);
hold off;


