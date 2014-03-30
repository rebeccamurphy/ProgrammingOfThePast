fun cipher() = 
	let
	val mess= String.explode("a test for alan")
	fun test(m:char, shift)=
		if (ord(m) = ord (#" ")) then
			3 (*space*)
		else if ((ord(m) + shift > 90 andalso ord(m)< 90) orelse (ord(m)+shift > 122)) then
			2 (*upper/lower case over shift*)
		else if ((ord(m) + shift < 65 andalso ord(m)<90) orelse(ord(m)+shift<97 andalso ord(m)>=97)) then 
			1 (*upper/lower case under shift*)
		else
			0; (*everything is fine*)

	fun encrypt2(nil, shift:int) = nil
		|encrypt2(x::xs, shift:int) =
		if (shift> 26 ) then 
		encrypt2(x::xs, shift mod 26)
		else 
		case (test(x, shift)) 
		of 
		(3)=> #" " :: encrypt2(xs, shift) |
		(2)=> chr(ord(x) +shift - 26 ) :: encrypt2(xs, shift) |
		(1)=> chr(ord(x) +shift + 26 ) :: encrypt2(xs, shift) |
		(0)=> chr(ord(x) +shift) :: encrypt2(xs, shift) |
		(_)=> nil;
	
	fun encrypt(message, shift:int) =
		String.implode(encrypt2(message, shift));
		
	fun decrypt(message, shift:int) =
		encrypt(message, ~(shift mod 26));
	
	fun solve (message, ~1) = "\n" |
		solve (message, maxShiftValue:int) =
		"Caesar " ^Int.toString(maxShiftValue) ^": " ^ encrypt(message, maxShiftValue) ^"\n" ^ solve(message, maxShiftValue-1);
	in
	print(encrypt(mess, 27) ^ "\n" 
	^decrypt(mess, 27) ^ "\n"
	^solve(mess, 27) ^ "\n" )
	end;