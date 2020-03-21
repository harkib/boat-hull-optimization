function print(vars)

global deck_width; 

[p,d,w,x,y] = get_pdwxy(vars);

% plot p
x1 = linspace(0,w/2);
y1 = polyval(p,x1);
x2 = -x1;
y2 = y1;
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold on
plot(x2,y2)
hold on
yline(polyval(p,get_z(p,d,w)),'-.b');
yline(polyval(p,deck_width/2),'-.r');
z = get_z(p,d,w)
h = d - polyval(p,z)
d
w
end 

