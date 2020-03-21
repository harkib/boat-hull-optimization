%MSE 426 Final Project

% %5 variables,
% 1: depth
% 2: x2
% 3: x3
% 4: x4
% 5: w


%Global variables 
global thickness;
global load;
global load_hieght;
global deck_mass; 
global deck_width; 
global boat_length;
global boat_density;
global water_density;
global M_total;
thickness = .0015;%m
load = 200;% kg
load_hieght = .045;%m
deck_mass = 700; %kg
deck_width = 1.5; %m
boat_length = 3; %m
boat_density = 8050 ; %2700; %kg/m^3 aluminum 
water_density = 997; %kg/m^3

M_total = 0; 
%% main
close all;
clear;
clc;

d = 5;
for i = 1:d
    x0(i) = 1;
    lb(i)=.01;
    ub(i)=2;
end
lb(1)=.5;
lb(d)=1;

A = [0,1,-1,0,0;0,0,1,-1,0;-1,1,0,0,0;-1,0,1,0,0;-1,0,0,1,0]; 
B = [0;0;0;0;0];
%run fmin
optionsf = optimoptions('fmincon');
optionsf.MaxFunctionEvaluations = 1000;
[xopt,fval] = fmincon(@f,x0,A,B,[],[],lb,ub,@nonlcon,optionsf);
%print
fval
print(xopt);
%run GA

%print
