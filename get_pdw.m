function [p,d,w] = get_pdw(vars)

len = size(vars);
len = len(2);

segments = 2*(len - 1);
d = vars(1);
w = vars(len);
x = 0:w/segments:w/2;
%vars(2:len-1);
y = [0, vars(2:len - 1), d];
%y = [0, vars(2),vars(3),vars(4), d];
n =4;
p = polyfit(x,y,n);

end

