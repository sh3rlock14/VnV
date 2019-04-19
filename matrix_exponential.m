function [eAt, eAt_tilde] = matrix_exponential(A)
%MATRIX_EXPONENTIAL Computes e^(At) and e^(A_tilde*t) given a
%diagonalization of A

n = length(A(:,:));
syms 't'
%[vectors, values] = eigenstuff(A);
[vectors, values] = myEig(A);

if n == 2 && A(1,1) == A(2,2) && A(1,2) == -A(2,1) %if [[l w]; [-w l]]
    l = A(1,1);
    w = A(1,2);
    eAt = exp(l*t)*[[cos(w*t) sin(w*t)]; [-sin(w*t) cos(w*t)]];
    eAt_tilde = 0;
    %nuova aggiunta: if A is diag -> e^At is diag and equals to diag(e^l1t,...e^lnt)
elseif isdiag(A)
    eAt = diag(exp(values*t));
    eAt_tilde = '~';    %dont care
    
elseif length(values) == n %A is diagonalisable
    eAt_tilde = diag(exp(values*t));
    eAt = vectors*eAt_tilde/vectors; 
else %Jordan form
    eAt = A*t;
    eAt = expm(eAt);
    eAt_tilde = 0;
end

end

