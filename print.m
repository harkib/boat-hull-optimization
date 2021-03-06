function print(vars)

global deck_width; 

[p,d,w,m,x,y] = get_pdwmxy(vars);

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
yCm = Compute_Cm(p,d,w,m)
yCb = Compute_Cb(p,d,w)
plot(0,yCm,'x');
hold on
plot(0,yCb,'x');
hold on
z = get_z(p,d,w)
h = d - polyval(p,z)
d
w
deck_width
m
end 

