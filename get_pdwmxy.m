function [p,d,w,m,x,y] = get_pdwmxy(vars)

[p,d,w,m] = get_pdwm(vars);

len = size(vars);
len = len(2);
segments = 2*(len - 2);

x = 0:w/segments:w/2;
y = [0, vars(2:len - 2), d];


end

