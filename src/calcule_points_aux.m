function [x] = calcule_points_aux(p)
    n = size(p,2);
    A = full(gallery('tridiag', n, 1, 4, 1));
    A(1,1) = 2;
    A(n,n) = 2;
    B = zeros(n,2);
    B(1,:) = 3*(p(:,2)- p(:,1));
    for i=2:(n-1)
        B(i,:) = 3*(p(:,i+1)- p(:,i-1));
    end
    B(n,:) = 3*(p(:,n)- p(:,n-1));
    x = A\B;