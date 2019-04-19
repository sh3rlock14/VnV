function f = is_included(includee,includer)
% Returns whether linear space includer includes linear space includee

concat = [includee includer];
% if rank(concat) == rank(includer) ==> Im(includee) subset Im(includer)
f = (rank(concat) == rank(includer));

end
