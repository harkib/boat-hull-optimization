function [z] = get_z(p,d,w)

global boat_length;
global water_density;
global M_total;

submerged_x_func = @(z) integral(@(x) (polyval(p,z) - polyval(p,x)),0,z); 
submerged_x_goal = M_total/(2*boat_length*water_density);


eS = .0001;
n = 0;
eA = eS +1;
zU = w/2;
zL = 0;

while abs(eA) > eS && n < 100
    zR = (zU + zL)/2;
    mid = submerged_x_func(zR);
        if mid > submerged_x_goal
            zU = zR;
        else 
            zL = zR;
        end
    eA = abs(mid - submerged_x_goal);
    n = n + 1;
end
if n > 100
   n 
end

z = polyval(p,zR);

end

