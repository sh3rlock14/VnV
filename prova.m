%%
clear all
close all
clc



A = [[0 1]; [-2 3]];


[V, L]= eigenstuff(A)

[vectors, values] = myEig(A);

