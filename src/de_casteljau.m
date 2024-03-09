function [p] = de_casteljau(matrice, t)
    n= size(matrice, 2);
    m = zeros(2,n-1);
    if n == 1
        p = matrice(:,1);
    else 
        seq = 1:1:(n-1);
        for i = seq
            m(:,i) = (1-t)*matrice(:,i) + t*matrice(:,i+1);
        end
        p = de_casteljau(m,t);
    end