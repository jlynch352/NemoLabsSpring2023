% File: ThreeGraphs.m
%  Graphs 3 nullclines with three different r-values

% Parameters 
m  = 10;                           
b  = 1; 

%find critical r value based on m and b
rc = (m+1)^2/(4*m);               

% three r‐levels: below, at, above rc
r_levels = [0.5*rc, rc, 1.5*rc];
colors   = {'b','g','m'};
labels   = {sprintf('r = %.2f < r_c',r_levels(1)), sprintf('r = %.2f = r_c',r_levels(2)), sprintf('r = %.2f > r_c',r_levels(3))};

% p linespace
p = linspace(0,1,500);

% nullclines
rg_pathogen = 1 - p;                
% sets up equation for a given r
rg_macro = @(r) r ./ (1 + m.*p);    

% plot
figure('Color','w','Position',[300 300 600 450]);
hold on
plot(p, rg_pathogen, 'r--', 'LineWidth',2);

%% plots the three different macrophage-nullclines based on the r values
for i=1:3
    plot(p, rg_macro(r_levels(i)), colors{i}, 'LineWidth',1.5);
end
hold off

% plot
xlabel('p','FontSize',12);
ylabel('r·g','FontSize',12);
title(sprintf('Nullclines in (p, r·g), m = %.1f', m),'FontSize',14);
legend('r·g = 1–p', labels{:}, 'Location','northeast');
axis([0 1 0 1]);
grid on; 
box on;

