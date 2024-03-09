function [] = Hermite(matrice, matricep, res, q, clr)
n=size(matrice,2)-1;
    for i=1:n
      bi(1,1) = matrice(1,i);
      bi(2,1) = matrice(2,i);
      %plot(bi(1,1),matrice(2,1),'b');
      bi(1,2) = matrice(1,i) + matricep(1,i)/3;
      bi(2,2) = matrice(2,i) + matricep(2,i)/3;
      %plot(bi(1,:),bi(2,:),'b');
      bi(1,3) = matrice(1,i+1) - matricep(1,i+1)/3;
      bi(2,3) = matrice(2,i+1) - matricep(2,i+1)/3;
      %plot(bi(1,3),bi(2,3),'b');
      bi(1,4) = matrice(1,i+1);
      bi(2,4) = matrice(2,i+1);
      if q==1  
        plot(bi(1,:),bi(2,:),'b');
      end
      Bezier_curve_points = eval_bernstein(bi,i,i+1,res) ;
      plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:), clr, 'linewidth',1);
    end