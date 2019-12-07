function [L, U, P] = luFactor(A)
% this functin calculates the lu factoriztion of a matrix A using pivoting
% and keeping track of the row switches with the permutation matrix P
U = A
[n,q] = size(A);
L = zeros(n);
P = eye(n);
if n ~= q 
    error('matrix must be square');
end
for i = 1:(n-1)
    [~,max_loc1] = max(abs(U((i:n),i)));
    if i == 1
        max_loc = max_loc1;
    elseif i > 1
        max_loc = max_loc1 + (i-1);
    end
    temp = U(max_loc,:);
    tempp = P(max_loc,:);
    tempL = L(max_loc,:);
    U(max_loc,:) = U(i,:);
    P(max_loc,:) = P(i,:);
    L(max_loc,:) = L(i,:);
    U(i,:) = temp;
    P(i,:) = tempp;
    L(i,:) = tempL;
    a1 = U(i,:);
     for j = (i+1):n
        a2 = U(j,:);
        m = U(j,i)/U(i,i);
        L(j,i) = m;
        a2n = a2 - (a1.*m);
        U(j,:) = a2n;
     end
end
for k = 1:q
    L(k,k) = 1;
end