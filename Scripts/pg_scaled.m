% File: pg_scaled.m
% Dimensionless pathogen–generalist macrophage ODE simulator

function [t,p,g] = pg_scaled(IC, tspan, par)
    %unpacks parameters
    r = par.r;
    b = par.b;
    m = par.m;

    % system of two equations
    function dY = rates(~, Y)
        p = Y(1);
        g = Y(2);
        dp = p*(1 - p - r*g);
        dg = b*(1 - g - m*p*g);
        dY = [dp; dg];
    end

    % solve with ode45
    opts = odeset('RelTol',1e-6,'AbsTol',1e-8);
    [t, Y] = ode45(@rates, tspan, IC, opts);
    
    %return results
    p = Y(:,1);
    g = Y(:,2);
end
