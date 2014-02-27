function value = surf_stress(f)

global omega radius WT rspan % mu rho l

WT0 = [1.0 0.0];        % the initial values of [displacement stress]

omega = 2*pi*f;         % angular frequency (stress_disp_tor.m)

% integration by Matlab, calling our function stress_disp_tor.m to
% calculate derivatives (d/dr) of displacement and stress;
% on return the vectors radius and WT contain the values of radius
% and the displacement and stress eigenfunctions
% note: the dimension of radius and WT is the number of points needed for
%       the numerical integration -- THIS WILL VARY
[radius,WT] = ode45('stress_disp_tor',rspan,WT0);

% try these setting if you need really accurate eigenfunctions
%opts = odeset('reltol',1e-12,'abstol',1e-12);
%[radius,WT] = ode45('stress_disp_tor',rspan,WT0,opts);

value = WT(end,2);      % stress value at earth's surface (at r = rspan(2))
