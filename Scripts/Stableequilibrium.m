% Stableequilibrium.m
% Plots three phase-plane subplots: stable node, unstable node, saddle.

% settings
arrowGrid = 25;        
arrowScale = 1.2;       
tspan = [0 5];     
xL = [-3 3];    
yL = [-3 3];


% build mesh of the cordinate plane from (-3,3)

[x1,x2] = meshgrid(linspace(xL(1),xL(2),arrowGrid), linspace(yL(1),yL(2),arrowGrid));

% 3 systems
systems = { struct('A',[-1 0; 0 -2], 'title','Stable Node'), struct('A',[ 1 0; 0  2], 'title','Unstable Node'), struct('A',[ 1 0; 0 -1], 'title','Saddle Point')
};

% initial conditions for speecific trajectories
initials = [ 2  2;  2 -2;  -2  2;  -2 -2;  1 0;  0 1; 0 -1; -1 0;  1 -1;  -1 1;];


%Setss up figure
figure('Color','w','Units','normalized','Position',[.1 .2 .8 .5]);

%Plost the three cases of stability
for i = 1:3
  %Gets system
  sys = systems{i};
  A = sys.A;
  
  % sets up equations for the vector fields
  U = A(1,1)*x1 + A(1,2)*x2;
  V = A(2,1)*x1 + A(2,2)*x2;
  
  %Creates a subplot
  ax = subplot(1,3,i);
  hold(ax,'on');
  
  %Computes the vector fields for each point on the grids
  quiver(ax, x1, x2, U, V, arrowScale, 'Color',[0.2 0.2 0.2], 'AutoScale','on','AutoScaleFactor',arrowScale, 'MaxHeadSize',0.4,'LineWidth',0.8);
  
  % plots all the trajectories for each of the intial points by useing
  % ODEsim
  for j = 1:size(initials,1)
      x0 = initials(j,:)';
      [t,x] = ode45(@(t,x) A*x, tspan, x0);
      plot(ax, x(:,1), x(:,2), 'b', 'LineWidth',1.2);
      plot(ax, x(1,1), x(1,2), 'bo', 'MarkerFaceColor','b');
      plot(ax, x(end,1), x(end,2), 'bs', 'MarkerFaceColor','w');
  end
  
    % marks (0,0) as an equilibrium point
    plot(ax,0,0,'r*','MarkerSize',10,'LineWidth',1.5);
    
    grid(ax,'on');
    axis(ax,'equal');
    set(ax, 'XLim', xL, 'YLim', yL);

    xlabel(ax,'x_1'); ylabel(ax,'x_2');
    title(ax,sys.title,'FontWeight','normal');
  hold(ax,'off');
end

sgtitle('Phase-Plane Examples: Stable, Unstable, Saddle','FontSize',14);

