function [] = Lagrange(matrice, resolution)
n=size(matrice,2)-1;
curve_points = zeros(2, resolution);
param = 0:1/n:1;
for i=0:(resolution-1)
  t = i/(resolution-1);
  p = aitken_neville(matrice, param, t);
  curve_points(:, i+1) = p;
end
plot(curve_points(1,:), curve_points(2,:), 'm');