% File: RinTermsOfM.m
% Compares the R value need for a given 2D system, and a similair 3D system

%% Random paramters
h = 2;
k = 5;

% Create p linespace
p = linspace(0,1,1000);

% Find the r(m,p), and m(p) values for all points
den = 1 - 2.*p - (k.*p)./(h+p) - (k.*h.*p)./(h+p).^2;
m = (1 + (k.*h)./(h+p).^2) ./ den;
r_of_p = (1 - p - k.*(p./(h+p))) .* (1 + m.*p);

% If m is negative thrown out the points
mask = (m > 0);
m = m(mask);
r_of_p = r_of_p(mask);

% Start the graph at the minimum m value
minM = min(m);

% find r(m) in 2D for comparrison
m2 = linspace(min(m), max(m), 200);
r2 = (m2 + 1).^2 ./ (4*m2);
p2 = zeros(size(m2));    

% Plot  (m, r(m)), and (m(p), r(m,p)) so that you can compare the graphs 
figure;
plot(m, r_of_p, 'b-',  'LineWidth', 2); 
hold on
plot(m2,   r2,'r', 'LineWidth', 2);

xlabel('m');
ylabel('r');
xlim([minM 40]);
ylim([0 10]);

legend('r(m,p)','r(m)','Location','Best');
grid on;
title('Comparison of r(m,p) and r(m) ');






