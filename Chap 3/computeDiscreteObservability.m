function f = computeDiscreteObservability(A,C)
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

if rank_O == n
    fprintf("pertanto kerO = {0} ed il sistema e' quindi osservabile. \n")
    fprintf("L'osservabilita' implica la ricostruibilita', pertanto il sistema e' anche ricostruibile. \n")
else
    fprintf("Essendo il rango di O minore di n si ha che ker0 != {0} e il sistema non e'quindi osservabile. \n")
end