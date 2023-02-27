function [courbure_p] = courbe_focale(matrice, matriced)

n = size(matrice, 2)-1;
bi = 0; bi_d = 0; bi_d2 = 0;
res = 100;
courbure_p = [];
for i=1:n
    bi(1,1) = matrice(1,i);
    bi(2,1) = matrice(2,i);
    bi(1,2) = matrice(1,i) + matriced(1,i)/3;
    bi(2,2) = matrice(2,i) + matriced(2,i)/3;
    bi(1,3) = matrice(1,i+1) - matriced(1,i+1)/3;
    bi(2,3) = matrice(2,i+1) - matriced(2,i+1)/3;
    bi(1,4) = matrice(1,i+1);
    bi(2,4) = matrice(2,i+1);
    
    xi = eval_bernstein(bi, i+1, i, res);
    
    bi_d(1,1) = 3*( bi(1,2) - bi(1,1));
    bi_d(2,1) = 3*( bi(2,2) - bi(2,1));
    bi_d(1,2) = 3*( bi(1,3) - bi(1,2));
    bi_d(2,2) = 3*( bi(2,3) - bi(2,2));
    bi_d(1,3) = 3*( bi(1,4) - bi(1,3));
    bi_d(2,3) = 3*( bi(2,4) - bi(2,3));
    
    xi_d = eval_bernstein(bi_d, i+1, i, res);
    
    bi_d2(1,1) = 6*( bi(1,3) - 2*bi(1,2) + bi(1,1));
    bi_d2(2,1) = 6*( bi(2,3) - 2*bi(2,2) + bi(2,1));
    bi_d2(1,2) = 6*( bi(1,4) - 2*bi(1,3) + bi(1,2));
    bi_d2(2,2) = 6*( bi(2,4) - 2*bi(2,3) + bi(2,2));
    
    xi_d2 = eval_bernstein(bi_d2, i+1, i, res);
    
    temps = 1: 1 : res;
    for t=temps
        r(i*res+t) = det([xi_d(:,t) xi_d2(:,t)])/(norm(xi_d(:,t))^3);
        n(1,1) = -(xi_d(2,t)/norm(xi_d(:,t)));
        n(2,1) = xi_d(1,t)/norm(xi_d(:,t));
        pt = xi(:,t) + 3*r(i*res+t)*n;
        courbure_p = [courbure_p pt];
    end
end

    
    
    
    