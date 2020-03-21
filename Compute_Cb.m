function [Cb] = Compute_Cb(p,d,w)

submerged_x = get_z(p,d,w);

submerged_cross_section_area = 2* integral(@(x) (polyval(p,submerged_x) - polyval(p,x)),0,submerged_x);

y_bar_vol_func = @(x) .5*((polyval(p,submerged_x)).^2 - polyval(p,x).^2);
y_bar_vol = integral(y_bar_vol_func,0,submerged_x)/(submerged_cross_section_area);


Cb = y_bar_vol;
end

