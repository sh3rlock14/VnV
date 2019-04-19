function [free,forced] = response(A, B, u, time)
%RESPONSE computes free and forced response for matrix A

if strcmp(time, 'c')
    free = free_response_cont(A);
    forced = forced_response_cont(A, B, u);
elseif strcmp(time, 'd')
    free = free_response_disc(A);
    forced = forced_response_disc(A, B, u);
else 
    ME = MException('wrongParam:NoSuchTimeOption', ...
        '"%s" is an illegal value for parameter "time". Legal values are "c" and "d"',time);
    throw(ME)
end
    
end

function free = free_response_cont(A)
    
    n = length(A(:,:));
    syms 'x_%d(x)' [1 n];
    [eAt,~] = matrix_exponential(A);
    free = eAt*conj(x(0)');

end

function forced = forced_response_cont(A, B, u)
    
    [eAt,~] = matrix_exponential(A);
    syms 't';
    integrate = eAt*B*u(t);
    forced = int(integrate(:), 0, t);
    
end

function free = free_response_disc(A)

    n = length(A(:,:));
    syms 'x_%d(x)' [1 n], syms 't';
    free = A^t * conj(x(0)');
    
end

function forced = forced_response_disc(A, B, u)

    syms 't', syms 'k';
    expand = A^(t-1-k) * B * u(t);
    forced = symsum(expand, k, 0, t-1);
    
end