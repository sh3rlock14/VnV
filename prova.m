%%
clear all
close all
clc



%A = [[2 0]; [0 3]];
A = [[0 1]; [-2 3]];

%[V, L]= eigenstuff(A)

[vectors, values] = myEig(A)

%[eAt, eA_tildet] = matrix_exponential(A);

%%
A = [[2 0]; [0 3]];
[V, L] = eig(A);


