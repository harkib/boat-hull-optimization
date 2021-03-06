%MSE 426 Final Project
close all;
clear;
clc;

% %5 variables,
% 1: depth
% 2: x2
% 3: x3
% 4: x4
% 5: w
% 6: extra_mass m %kg


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
thickness = .01;%m
load = 000;% kg
load_hieght = .045;%m
deck_mass = 300; %kg
deck_width = 1; %m
boat_length = 2; %m
boat_density = 2700 ; % %kg/m^3 aluminum 
water_density = 997; %kg/m^3

M_total = 0; 
%main


x0 = [.5,1.5,.5,.5,deck_width,0];
lb = [.75,0,0,0,deck_width, 0];
ub_ = 1.5;
ub = [ub_,ub_,ub_,ub_,ub_, 1500];

y_min_spacing = -.1;
A = [-1,0,0,1,0,0; 0,0,1,-1,0,0; 0,1,-1,0,0,0; 0,-1,0,0,0,0];
B = [y_min_spacing,y_min_spacing,y_min_spacing,y_min_spacing];

%run fmin
optionsf = optimoptions('fmincon');
%optionsf.MaxFunctionEvaluations = 1000;
[xoptF1,fval] = fmincon(@f,x0,A,B,[],[],lb,ub,@nonlcon,optionsf);
%print
fval
xoptF1
print(xoptF1);

%run GA
[xoptGA,fval,exitflag,output,population,scores] = ga(@f,6,A,B,[],[],lb,ub,@nonlcon);
%print
fval
xoptGA
print(xoptGA);

x0 = xoptGA;
%run fmin
optionsf = optimoptions('fmincon');
%optionsf.MaxFunctionEvaluations = 1000;
[xoptF2,fval] = fmincon(@f,x0,A,B,[],[],lb,ub,@nonlcon,optionsf);
%print
fval
xoptF2
print(xoptF2);