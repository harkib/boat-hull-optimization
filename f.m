function [output] = f(vars)

[p,d,w] = get_pdw(vars);

Cm = Compute_Cm(p,d,w);
Cb = Compute_Cb(p,d,w);

output = Cb - Cm;
end

