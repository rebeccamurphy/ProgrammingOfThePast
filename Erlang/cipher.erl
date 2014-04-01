-module(cipher).%t to compiler erl into cmd, and c(cipher). run cipher:main().
-export([main/0]). %export allows it to be called outside the module. 
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
	if (Shift > 26 orelse -Shift >26) -> %no ; if one if statement
		encrypt([First] ++ Rest, Shift rem 26);
		true -> % all other
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
	io:format("~s~n", [""]),
	io:format("~s~n", ["...BEEP BOOP ENCRYPTING..."] ),
	io:format("~s~n", [ "MESSAGE: Brain the size of a planet."]),
	io:format("~s~n", [["SECRET:  "] ++ encrypt("Brain the size of a planet.", 1)]),
	io:format("~s~n", [""]),
	io:format("~s~n", ["...BOOP BEEP DECRYPTING..."] ),
	io:format("~s~n", [ "MESSAGE: boe uifz ibwf nf epjoh dbftbs djqifst"] ),
	io:format("~s~n", [["SECRET:  "] ++ decrypt("boe uifz ibwf nf epjoh dbftbs djqifst", 27)]),
	io:format("~s~n", [""]),
	io:format("~s~n", ["...BEEP SOLVING BOOP..."] ),
	io:format("~s~n", [solve("pathetic", 26)]).

