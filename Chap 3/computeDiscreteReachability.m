function f = computeDiscreteReachability(A,B)
% Computes the reachability of the given discrete-time system

% La matrice A ha m righe ed n colonne, in realta' essendo quadrate ha n
% righe ed n colonne
[m,n] = size(A);

% R_0 
fprintf("R_0 \n")
R = B;
disp(R)
reachableFlag = 0;

% Creazione di R_n
for k = 1:n-1
    R = [R (A^k)*B];
    fprintf("R_%d: \n",k);
    disp(R)
    if rank(R) == n
        fprintf("La matrice di raggiungibilita R_%d ha rango n, pertanto il sistema e' raggiungibile. \n",k)
        reachableFlag = 1;
        break
    end
end

if reachableFlag == 0 
    fprintf("La matrice di raggiungibilita ha rango %d < n pertanto il sistema non e' raggiungibile \n",rank(R))
end