function [Bezier_curve_points]= eval_deCasteljau(matrice,a,b,resolution)

n=size(matrice,2)-1 % degre de courbe avec n+1 points de controle
%temps=1:resolution;
temps= a : ((b-a)/resolution) : b;
cp = 0;
for t=temps
   % Calcul du point de la courbe x(t) avec l'algorithme de DeCasteljau
   vect_bernstein_x(1,:) = matrice(1,:);
   vect_bernstein_y(1,:) = matrice(2,:);
    for k=2:n+1
        for i=1:n-k+2
            vect_bernstein_x(k,i) = ((b-t)/(b-a))*vect_bernstein_x(k-1,i)+((t-a)/(b-a))*vect_bernstein_x(k-1,i+1);
            vect_bernstein_y(k,i) = ((b-t)/(b-a))*vect_bernstein_y(k-1,i)+((t-a)/(b-a))*vect_bernstein_y(k-1,i+1);
        end;
    end;
    cp=cp+1;
    Bezier_curve_points(1,cp)=vect_bernstein_x(n+1,1);
    Bezier_curve_points(2,cp)=vect_bernstein_y(n+1,1);
    vect_bernstein_x(2,:)
    vect_bernstein_y(2,:)
end 