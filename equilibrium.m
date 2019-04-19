function eq = equilibrium(A, B, time)
%EQUILIBRIUM Computes equilibriums for the system as a function of u

syms 'u';
if strcmp(time, 'c')
    eq = A \ -B*u; %impone condizione Ax + Bu = 0
elseif strcmp(time, 'd')
    eq = (A - eye(length(A(:,:)))) \ -B*u;
else 
    ME = MException('wrongParam:NoSuchTimeOption', ...
        '"%s" is an illegal value for parameter "time". Legal values are "c" and "d"',time);
    throw(ME)
end

end

