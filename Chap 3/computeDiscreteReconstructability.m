function f = computeDiscreteReconstructability(A,C)

[m,n] = size(A);

O = C;

for i = 1:n-1
    O = [O;C*A^i];
end

ker_O = null(O);
ker_A_n = null(A^n);
fprintf("La matrice di osservabilita O: \n")
disp(O)

fprintf("Kernel di O \n");
disp(ker_O);
fprintf("Kernel di A^n \n");
disp(ker_A_n);

if includedIn(ker_O,ker_A_n)
    fprintf("ker_O incluso in ker_A_n pertanto il sistema e' ricostruibile. \n")
else
    fprintf("ker_O non e' incluso ker_A_n pertanto Il sistema non e' ricostruibile. \n")
end

