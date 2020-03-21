function [p,d,w,x,y] = get_pdwxy(vars)

[p,d,w] = get_pdw(vars);

len = size(vars);
len = len(2);
segments = 2*(len - 1);

x = 0:w/segments:w/2;
y = [0, vars(2:len - 1), d];


end

