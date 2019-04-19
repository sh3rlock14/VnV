function f = computeContinuousObservabilityAndReconstructability(A,C)
% Calcola l'osservabilita del sistema tempo discreto
[m,n] = size(A);

O = C;

for i = 1:n-1
    O = [O;C*A^i];
end

rank_O = rank(O);
fprintf("La matrice di osservabilita O: \n")
disp(O)

fprintf("La matrice di osservabilita O ha rango %d \n",rank_O)
% If rank(O) == n ==> e' osservabile
if rank_O == n
    fprintf("Pertanto ker0 = {0} e il sistema e' quindi osservabile, un sistema tempo continuo e' osservabile se e solo e' ricostruibile pertanto e' anche ricostruibile. \n")
else
    fprintf("Essendo il rango di O minore di n il sistema non e' osservabile ne' ricostruibile \n")
end