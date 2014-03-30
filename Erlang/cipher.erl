-module(cipher).
% double has 1 argument. export allows it to be called outside the module. 
-export([fac/1, list_length/1, encrypt/2]).
fac(1) ->
	1; %semi colons end blocks, periods end functions. 
fac(N) ->
	N * fac(N - 1).

list_length([]) ->
0;
%The length of an empty list is obviously 0.
list_length([First | Rest]) ->
1 + list_length(Rest).

encrypt([], Shift) -> [];
encrypt([First | Rest], Shift) -> 
		%io:format("~p~n", [[First+ Shift]]).
		%string:join(cipher:encrypt("ABC", 1)). will return the right string
	if 
		1==1 -> 
			[[First + Shift]] ++ encrypt(Rest, Shift);
	end.

