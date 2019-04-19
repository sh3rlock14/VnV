function [eigenvectors, eigenvalues] = myEig(A)
%EIGENSTUFF computes eigenvalues and eigenvectors for A

[vectors, eigenvalues] = eig(A,'vector');
%eigenvectors = vectors;

%A � quadrata, mi basta una sua dimensione
n = size(A,1);

%verifico che abbia n autovalori (contati con le
% molteplicit� algebriche)
nEigVal = length(eigenvalues);

if (nEigVal < n || rank(vectors)<n) %la matrice non � diagonalizzabile
    warning('Cannot diagonalise A. Returning partial eigenvalues and corresponding eigenvectors');
    %return
end

%calcolo il numero di autovalori distinti se sono proprio n -> A � diagonalizzabile
% a questo punto non dovrebbe pi� serivire: A � diagonalizzabile
%un = length(unique(eigenvalues));
eigenvectors = vectors*spdiag(1./sqrt(sum(vectors.^2, 1)));
eigenvectors = eigenvectors./eigenvectors(1,:);


L = eigenvectors;
A_tilde = diag(eigenvalues);
zero = A - L*A_tilde/L;
if (~sum(zero,'all'))
    disp("La matrice L �:");
    disp(L);
    disp("La matrice A_tilde �:");
    disp(A_tilde);
end

end