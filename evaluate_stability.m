function [stable, asymp] = evaluate_stability(A, time)
%EVALUATE_STABILITY Decides whether the system is stable and/or
%asymptotically stable
%1: true, 0: false

val = sort(eig(A));
x = unique(val);
count = zeros(size(x));
for i=1:length(count)
    count(i) = sum(val == x(i));
end
single = x(count(:) == 1);
mult = x(count(:) > 1);

if strcmp(time, 'c')
    le_0 = real(single(:)) <= 0; %deve valere per l t.c. geom_mult(l) == 1
    lt_0 = real(mult(:)) < 0;  %per gli altri, deve essere < 0
    stable = prod(le_0) * prod(lt_0);
    asymp = prod(real(val(:)) < 0);
elseif strcmp(time, 'd')
    le_1 = abs(single(:)) <= 1; %deve valere per l t.c. geom_mult(l) == 1
    lt_1 = abs(mult(:)) < 1;  %per gli altri, deve essere < 1
    stable = prod(le_1) * prod(lt_1);
    asymp = prod(abs(val(:)) < 1);
else 
    ME = MException('wrongParam:NoSuchTimeOption', ...
        '"%s" is an illegal value for parameter "time". Legal values are "c" and "d"',time);
    throw(ME)
end

end

