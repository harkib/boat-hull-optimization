function [c,ceq] = nonlcon(vars)
global deck_width; 
[p,d,w,m] = get_pdwm(vars);
z = get_z(p,d,w);
h = d - polyval(p,z);

c(1) = z - w/2;
c(2) = .3 - h; %global
c(3) = .45 - d + polyval(p,deck_width/2);
c(4) = -.70 - d + polyval(p,deck_width/2);
c(5) = Compute_Cm(p,d,w,m) - Compute_Cb(p,d,w); 
%p_prime = polyval(p,(deck_width + .001) /2) - polyval(p,deck_width/2);
%c(5) = deck_width/2 - w/2;
%c(6) = -p_prime;
ceq =[];
end

