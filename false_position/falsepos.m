function [root,fx,ea,iter] = falsepos(func,xl,xu,es,maxit)
% required inputs: [function , lower guess , upper guess]
%
% following optional inputs [..., error bound , maximum iterations]
%
% this function finds the root of a function by drawing a line between two
% points and finding where the line intersects the x axis and using that
% point as the guess for the next ieration. by default the max iteration is
% set at 50 and the error set at 0.0001. 

% the following lines allow for no input for the es and maxit variables and
% handle errors 
if nargin<3 
    error('at least three inputs are required')
end
sfxl = sign(func(xl)); sfxu = sign(func(xu));
if sfxl == sfxu
    error('no sign change')
end
if nargin < 4
    es = 0.0001; 
end
if nargin < 5
    maxit = 50; 
end

% initial conditions for iteration are set 
iter = 0; xr = xl; ea = 100;

% the following while loop iterates finding a new guess and then using it
% to find another new gusss until the approx error is less than a the
% specified value or the maximum number of iteration is met
while ea > es && iter < maxit
    xro = xr;
    xr = xu - ((func(xu).*(xu-xl))/(func(xu)-func(xl)));
    sfxr = sign(func(xr));
    ea = abs((xr - xro)/xr)*100;
    if sfxr == sfxl
        xl = xr;
    elseif sfxr == sfxu
        xu = xr;
    elseif func(xr) == 0
        ea = 0;
    end
    iter = iter + 1;
end
root = xr; fx = func(root);
    