function [Cm] = Compute_Cm(p,d,w,m)
global thickness;
global load;
global deck_mass; 
global boat_length;
global boat_density;
global load_hieght;
global deck_width; 

%p_func = @(x) polyval(p,x);


diff_func = @(x) polyval(p,x) - polyval(p,x - thickness);
boat_cross_section_area = 2* integral(diff_func,0,w/2);

boat_mass = boat_cross_section_area* boat_length*boat_density;
M_total = boat_mass + load + deck_mass + m;
setGlobal_M_total(M_total);

y_bar_boat_func = @(x) .5*(polyval(p,x).^2 - polyval(p,x - thickness).^2);
y_bar_boat = integral(y_bar_boat_func,0,w/2)/(boat_cross_section_area/2);

boat_Cm = y_bar_boat*boat_cross_section_area*boat_length*boat_density/M_total;
load_Cm = d - load_hieght; %global
deck_Cm = polyval(p,deck_width/2);%global

Cm = (boat_Cm*boat_mass + load_Cm*load + deck_Cm*deck_mass)/M_total;
end

