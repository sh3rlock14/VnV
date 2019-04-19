function [reach, obs, cont, recon] = evaluate_structural_properties(A, B, C, time)
%EVALUATE_REACHABILITY decides whether input linear system is reachable,
%observable, controllable and reconstructable
%NOTA: per giustificare i risultati nel compito, calcolare il rango con
%l'eliminazione di Gauss o vedendo le righe linearmente indipendenti
    
n = length(A(:,:));
[reach, R] = reachability(A, B);
[obs, O] = observability(A, C);

if strcmp(time, 'c')
    cont = (reach == 1); %system is controllable iif is reachable
    recon = (obs == 1); %system is reconstructable iif is observable
    
elseif strcmp(time, 'd')
    if reach == 1 %a reachable system is controllable
        cont = 1;
    else %else if imA^n included in imR, then system is controllable
        cont = is_included(colspace(sym(A^n)), colspace(sym(R)));
    end
    
    if obs == 1 %an observable system is reconstructable
        recon = 1;
    else %else if kerO included in kerA^n, then system is reconstructable
        recon = is_included(null(O), null(A^n));
    end
else 
    ME = MException('wrongParam:NoSuchTimeOption', ...
        '"%s" is an illegal value for parameter "time". Legal values are "c" and "d"',time);
    throw(ME)
end

end

function [reach, R] = reachability(A, B)
    
    n = length(A(:,:));
    R = zeros(n); %reachability: same computation for both c- and d- time
    R(:,1) = B;
    for i = 1:n-1
        R(:,i+1) = (A^i)*B;
    end
    reach = (rank(R) == n);%reachable if full rank
    
end

function [obs, O] = observability(A, C)
    
    n = length(A(:,:));
    O = zeros(n); %observability: same computation for both c- and d- time
    O(1,:) = C;
    for i = 1:n-1
        O(i+1,:) = C*(A^i);
    end
    obs = (rank(O) == n); %observable if ker(O) == empty linear space
    
end