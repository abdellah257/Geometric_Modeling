function [] = courbe_C2(matrice, res)
n = size(matrice, 2);
if n<2
    return
end

aux = transpose(calcule_points_aux(matrice));
pts = zeros(2,res);
u = 0;
us = (n-1)/res;
k = -1;
nv = zeros(2,4);
for i=1:(res-1)
    nk = floor(u)+1;
    if k ~= nk
        k = nk;
        pk = matrice(:,k);
        pk1 = matrice(:, k+1);
        dk = aux(:, k);
        dk1 = aux(:, k+1);
        nv = [pk (pk+dk/3) (pk1-dk1/3) pk1];
    end
    t = u-k+1;
    pts(:, i) = de_casteljau(nv, t);
    u = u + us;
end
pts(:, res) = matrice(:,n);
plot(pts(1,:), pts(2,:), 'b');