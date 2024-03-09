function [pts] = butterfly(w, h, res)
    x0 = w/2;
    y0 = h/2;
    for i = 1:res
        t = 20*i/res;
        pts(1,i) = x0 + 1.5*sin(t)*(exp(cos(t))-2*cos(4*t)-sin(t/12)^5);
        pts(2,i) = y0 + 1.5*cos(t)*(exp(cos(t))-2*cos(4*t)-sin(t/12)^5);
    end
    