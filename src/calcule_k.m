function [matricep] = calcule_k(matrice, c, t, b)  % Kochanek-Batrels spline 
    n=size(matrice,2)-1;
    matricep = zeros(n+1,2);
    matricep(1,1) = (1-c)*(1-b)*(1+t)*(matrice(1,2)-matrice(1,1));  
    % c = tension change la longuer du vecteur tangent 
    % b=  bias change la direction du vecteur tangent 
    % t = continuite : change 'the sharpness' entre les tengentes. 
                                                                   
    matricep(2,1) = (1-c)*(1-b)*(1+t)*(matrice(2,2)-matrice(2,1));
    for i=2:n
          matricep(1,i) = ((1+b)*(1-t)*(matrice(1, i)-matrice(1, i-1))+ (1-b)*(1+t)*(matrice(1, i+1)-matrice(1, i)))*((1-c)/2);
          matricep(2,i) = ((1+b)*(1-t)*(matrice(2, i))-matrice(2, i-1)+ (1-b)*(1+t)*(matrice(2, i+1)-matrice(2, i)))*((1-c)/2);
    end
    matricep(1,n+1) = (1-c)*(1+b)*(1-t)*(matrice(1,n+1) - matrice(1,n));
    matricep(2, n+1) = (1-c)*(1+b)*(1-t)*(matrice(2,n+1) - matrice(2, n));
end