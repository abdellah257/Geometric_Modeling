function [pts] = flower(w, h, res)
    x0 = w/2;
    y0 = h/2;
    for i = 1:res
        t = 10*i/res;
        pts(1,i) = x0 + 4*cos(4*t)*cos(t);
        pts(2,i) = y0 + 4*cos(4*t)*sin(t);
    end