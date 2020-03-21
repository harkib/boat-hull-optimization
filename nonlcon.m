function [c,ceq] = nonlcon(vars)
global deck_width; 
[p,d,w] = get_pdw(vars);
z = get_z(p,d,w);
h = d - polyval(p,z);

c(1) = z - w/2;
c(2) = h - .03; %global
c(3) = .06 - d + polyval(p,deck_width/2);
ceq =[];
end

