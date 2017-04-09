%
% lab_pca.m
% Carl Tape, GEOS 627, Inverse Problems and Parameter Estimation
%
% Principal Component Analysis of diets in Europe.
%

clc, clear, close all

% load the data, compute correlations, and make scatterplots
load_pca_data;
[n,p] = size(X);
xinds = [1:p];    

% scatterplot matrix: uncentered, unstandardized
figure, gplotmatrix(X,[],[],[],[],[],[],[],vars,vars), 

% START YOUR ANALYSIS HERE


