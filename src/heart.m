function [pts] = heart(w, h, res)
    x0 = w/2;
    y0 = h/2;
    for i = 1:res
        t = 10*i/res;
        pts(1,i) = x0 + 16*(sin(t)^3);
        pts(2,i) = y0 + 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t);
    end
    