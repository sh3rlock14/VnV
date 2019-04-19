function [eigenvectors,eigenvalues] = eigenstuff(A)
%EIGENSTUFF computes eigenvalues and eigenvectors for A  

[vectors, eigenvalues] = eig(A, 'vector');
if all(eigenvalues == eigenvalues(1)) %non diagonalizzabile
    warning('Cannot diagonalise A. Returning partial eigenvalues and corresponding eigenvectors');
    eigenvalues = eigenvalues(1);
    eigenvectors = vectors(:,1);
end
B = diag(1./(vectors(1,:))); %porta i vettori in una forma ragionevole   
eigenvectors = vectors*B;

end

