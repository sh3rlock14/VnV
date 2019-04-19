function f = computeDiscreteControllability(A,B)
% Calcola la controllabilita' del sistema tempo discreto dato in input

[m,n] = size(A);

R = B;

for i = 1:n-1
    R = [R (A^i)*B];
end

A_n = sym(A^n);
Im_A_n = colspace(A_n)
Im_R = colspace(sym(R))
% L'immagine di A e' contenuta nell'immagine di R se ogni combinazione
% lineare delle colonne di A e' anche ottenibile come combinazione lineare
% delle colonne di R, ossia A non contiene vettori linearmente indipendenti
% dai vettori di R; verificare cio' equivale a verificare che il rango
% della matrice ottenuta unendo le colonne di A e R abbia lo stesso rango
% di R.

if includedIn(Im_A_n,Im_R)
    fprintf("Im(A^n) e' contenuta in Im(R_n) pertanto il sistema e' controllabile \n")
else
    fprintf("Im(A^n) non e' contenuta in Im(R_n) pertanto il sistema non e' controllabile \n")
end
