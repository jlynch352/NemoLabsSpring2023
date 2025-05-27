% File: pg_unscaled.m
% Unscaled pathogen–macrophage ODE sim

function [t,P,G] = pg_unscaled(IC, interval, par)
   
    delta = par.delta;
    sigma = par.sigma;
    mu = par.mu;
    alpha = par.alpha;
    beta = par.beta;

    %system of equations
    function dY = rates(~,Y)
        P = Y(1);
        G = Y(2);
        dP = alpha*P*(1 - P/beta) - mu*G*P;
        dG = delta - sigma*G - (mu*G*P);
        dY = [dP; dG];
    end

    %solves the system numerically
    opts = odeset('RelTol',1e-6,'AbsTol',1e-8);
    [t,Y] = ode45(@rates, interval, IC, opts);

    P = Y(:,1);
    G = Y(:,2);
end
