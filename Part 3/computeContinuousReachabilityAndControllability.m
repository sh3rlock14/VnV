function f = computeContinuousReachabilityAndControllability(A,B)
% Calcola l'osservabilita del sistema tempo discreto
[m,n] = size(A);

R = B;

for i = 1:n-1
    R = [R (A^i)*B];
end

rank_R = rank(R);
fprintf("La matrice di raggiungibilita R: \n")
disp(R)

fprintf("La matrice di raggiungibilita R ha rango %d \n",rank_R)
% If rank(R) == n ==> e' osservabile
if rank_R == n
    fprintf("Il sistema e' quindi osservabile, nel caso dei sistemi tempo continuo il sistema e' osservabile se e solo se e' raggiungibile, pertanto e' anche raggiungibile. \n")
else
    fprintf("Essendo il rango di R minore di n il sistema non e' osservabile pertanto neanche raggiungibile. \n")
end