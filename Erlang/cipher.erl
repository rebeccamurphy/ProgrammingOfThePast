-module(cipher).
% double has 1 argument. export allows it to be called outside the module. 
%t to compiler erl into cmd, and c(cipher). run cipher:main().
-export([encrypt/2, test/2, main/0]).
test (M, Shift) ->
	if (M ==  32) -> 
			3; %space;
	(( M + Shift > 90 andalso M< 90) orelse ( M +Shift > 122)) ->
			2; %upper/lower case over shift
	(( M + Shift < 65 andalso M<90) orelse(M+Shift<97 andalso M>=97)) ->
			1; %upper/lower case under shift
	true -> 
			0 %everything is fine
	end.
encrypt([], Shift) -> [];
encrypt([First | Rest], Shift) -> 
		%io:format("~p~n", [[First+ Shift]]).
		%string:join(cipher:encrypt("ABC", 1),""). will return the right string
		%no ; if one if statement
	if (Shift > 26 orelse -Shift >26) ->
		encrypt(list:append(First,Rest), Shift rem 26);
		true ->
	case test(First, Shift) of
		(3) -> 
			" "++ encrypt(Rest,Shift);
		(2) -> 
			[[First + Shift - 26]] ++ encrypt(Rest, Shift);
		(1) -> 
			[[First + Shift + 26]] ++ encrypt(Rest, Shift);
		(0) ->
			[[First + Shift]] ++ encrypt(Rest, Shift);
		_ -> true
	end
end.

decrypt(Message,Shift) -> 
	encrypt(Message, -Shift).
solve(Message, -1) -> "";
solve(Message, MaxShiftValue) ->
	[["Caesar "++ integer_to_list(MaxShiftValue) ++ ": "]] ++encrypt(Message, MaxShiftValue) ++ [["\n"]] ++ solve(Message, MaxShiftValue -1) .
main() ->
	io:format("~s~n", [encrypt("A butt", 1)]),
	io:format("~s~n", [decrypt("A butt", 1)]),
	io:format("~s~n", [solve("A butt", 26)]).

