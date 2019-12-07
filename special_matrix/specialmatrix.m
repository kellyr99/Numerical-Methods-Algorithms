function [A] = specialmatrix(n,m)
    % error handler 
    b = nargin;
    if b ~= 2
        error('only exactly two inputs are accepted')
    end
   % zeros matrix 
    A = zeros(n,m);
    % set up first row
    for i = 1:n
        A(i,1) = i;
    end
    % set up first column 
    for j = 1:m
        A(1,j) = j;
    end
    % fill in the rest of the matix 
    for r = 2:n
        for c = 2:m
            A(r,c) = A((r-1),c) + A(r,(c-1));
        end
    end
end
