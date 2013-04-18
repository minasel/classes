%
% hw_grav.m
% Carl Tape, GEOS 627, Inverse Problems and Parameter Estimation
%
% Estimate density variations using singular value decomposition.
%

clear
close all
clc

% vector of gravity observations
d = [
   3.200806372256319
   4.281623543773417
   5.000263689234144
   6.083743151550228
   6.755930945340174
   6.643468068035755
   6.585278806244575
   5.953388158640383
   5.123776695089963
   4.247191182133855
   3.175260569937137
   2.511125551747691
   2.004733630167365
   1.333121959786504
   0.949130251286033 ];

n = length(d);  % number of data
m = n;          % number of model parameters

% construct discretization vector for model
xmin = 0;
xmax = 1;
xvec = collocate(xmin,xmax,n);

% construct discretization vector for data
ymin = 0;
ymax = 1;
yvec = collocate(ymin,ymax,m);

whos xvec yvec d

% construct design matrix G

