function [matricep] = calcule_m(matrice, c, q)
    n=size(matrice,2)-1;
    matricep = zeros(n+1,2);
    if q==0
        matricep(1,1) = (1-c)*(matrice(1,2)-matrice(1,1));
        matricep(2,1) = (1-c)*(matrice(2,2)-matrice(2,1));
        for i=2:n
          matricep(1,i) = (1-c)*(matrice(1, i+1)-matrice(1, i-1))/2;
          matricep(2,i) = (1-c)*(matrice(2, i+1)-matrice(2, i-1))/2;
        end
        matricep(1,n+1) = (1-c)*(matrice(1,n+1) - matrice(1,n));
        matricep(2, n+1) = (1-c)*(matrice(2,n+1) - matrice(2, n));
    else
        for i = 1:n
            matricep(1,i) = (1-c)*(matrice(1,i+1) - matrice(1,i));
            matricep(2,i) = (1-c)*(matrice(2,i+1) - matrice(2,i));
        end
        matricep(1,n+1) = (1-c)*(matrice(1,n+1) - matrice(1,n));
        matricep(2,n+1) = (1-c)*(matrice(2,n+1) - matrice(2,n));
    end