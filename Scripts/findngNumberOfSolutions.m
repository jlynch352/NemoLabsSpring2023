% File: findingNumberOfSolutions_simple.m
% shows how different r-values -all else equal- effect the number of
% solutions the system has

% Parameters
b = 1;
m = 3;

%% MULTIPLE R_VALUES
r_vals = [1, 4/3, 2];

% LineSpace
p = linspace(-0.2, 1.2, 500);

% Plot setup
figure('Color','w'); 

%Plot setup
hold on; 
grid on;

% different colors for plot
colors = {'r-','b--','g:'};

% Loop over each r-value
for i = 1:numel(r_vals)
    % Gets r values
    r = r_vals(i);
    % builds a quadratic wheere it roots represent equilibrium points
    f = m*p.^2 + (b-m)*p + (r-b);
    
    % Plot the quadratic
    plot(p, f, colors{i}, 'LineWidth', 2);
    
    % Find and mark real roots in [0,1]
    rp = roots([m, b-m, r-b]);
    % only keeps points that are equal to zero -( *When the imaganary part
    % is zero*) and between 0 and 1
    rp = rp(imag(rp)==0 & rp>=0 & rp<=1);
    %plots the zero points
    plot(rp, zeros(size(rp)), 'o', 'MarkerSize', 8, 'LineWidth', 1.5, 'Color', colors{i}(1));
    
    % plots the cases for when the discriminant equals zero (One Solution) 
    % checks using a numerical thresshold to plot the zero poin
    disc = (b-m)^2 - 4*m*(r-b);
    if abs(disc) < 1e-6
        p_vertex = -(b-m)/(2*m);
        plot(p_vertex, 0, 'o', 'MarkerSize', 12, 'LineWidth', 2,'MarkerEdgeColor', colors{i}(1), 'MarkerFaceColor', 'none');
    end
end

% plot y = 0
plot(p, zeros(size(p)), 'k--', 'LineWidth', 1);

%% Labels
xlabel('p (scaled pathogen fraction)', 'FontSize', 12);
ylabel('f(p)', 'FontSize', 12);
title('Number of Solutions','FontSize', 14);

% Builds legend
labels = [sprintfc('r = %.2f', r_vals), {'zero line'}];
legend(labels{:}, 'Location', 'northwest', 'FontSize', 11);

xlim([-0.1, 1.1]);
ylim([-0.5, 1]);

hold off;








