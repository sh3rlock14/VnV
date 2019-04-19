function [eigenvectors, eigenvalues] = myEig(A)
%EIGENSTUFF computes eigenvalues and eigenvectors for A

[vectors, eigenvalues] = eig(A,'vector');
%eigenvectors = vectors;

%A è quadrata, mi basta una sua dimensione
n = size(A,1);

%verifico che abbia n autovalori (contati con le
% molteplicità algebriche)
nEigVal = length(eigenvalues);

if (nEigVal < n || rank(vectors)<n) %la matrice non è diagonalizzabile
    warning('Cannot diagonalise A. Returning partial eigenvalues and corresponding eigenvectors');
    %return
end

%calcolo il numero di autovalori distinti se sono proprio n -> A è diagonalizzabile
% a questo punto non dovrebbe più serivire: A è diagonalizzabile
%un = length(unique(eigenvalues));
eigenvectors = vectors*spdiag(1./sqrt(sum(vectors.^2, 1)));
eigenvectors = eigenvectors./eigenvectors(1,:);

end