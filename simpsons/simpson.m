function I = simpson(x,y)

maxdist = 2*(eps);
[~,sx] = size(x);
[~,sy]= size(y);
n = sx;
N = n-1;
oetest = mod(N,2);
a = x(1)
b = x(n)
if sx == 2
    warning('trapazoid rule will be applied due to single interval')
    I = (b-a)*((y(1)+y(n))/2)
else
    for i = 1:n-1
        xdist(i) = x(i+1)-x(i);
    end
    for i = 1:n-2
        xdist2(i) = xdist(i+1)-xdist(i);
    end
    if sum(xdist2) >= maxdist
        error('x values are not evenly spaced')
    elseif sx~=sy
        error('one to one data required')
    elseif sx == 3
        I = ((b-a)/6)*(y(1)+4*(y(2))+y(3))
    elseif oetest == 0
        for i = 1:(N/2)
            j = 2*i;
            yodds(i) = y(j);
        end
        for i = 1:((n/2)-1)
            j = (2*i)+1;
            yevens(i) = y(j);
        end
     I = ((b-a)/(3*N))*(y(1)+4*(sum(yodds))+2*(sum(yevens))+y(n));
    elseif oetest ~= 0
        warning('Due to the size of the data, the trapazoidal rule must be used on the last interval')
        for i = 1:((n/2)-1)
            j = 2*i;
            yodds(i) = y(j);
        end
        for i = 1:((n/2)-2)
            j = (2*i)+1;
            yevens(i) = y(j);
        end 
        I = ((b-a)/(3*N))*(y(1)+4*(sum(yodds))+2*(sum(yevens))+y(N))+(((y(N)+y(n))/2)*(x(n)-x(N)));
    end
end
end
