function [p] = aitken_neville(matrice, param, t)
    n = size(matrice, 2);
    pi = matrice(:, :);
    for k=1:(n-1)
        for i=1:(n-k)
            p0 = pi(:,i);
            p1 = pi(:, i+1);
            dt = param(i+k)-param(i);
            pi(:, i) = ((param(i+k)-t)/dt)*p0 + ((t-param(i))/dt)*p1;
        end
    end
    p = pi(:,1);