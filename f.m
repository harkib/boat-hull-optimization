function [output] = f(vars)

[p,d,w,m] = get_pdwm(vars);

Cm = Compute_Cm(p,d,w,m);
Cb = Compute_Cb(p,d,w);

output = Cm - Cb;
end
