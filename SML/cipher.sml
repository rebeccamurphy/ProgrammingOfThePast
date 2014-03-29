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
			0; (*everthing is fine*)

	fun encrypt(nil, shift:int) = nil
		|encrypt(x::xs, shift:int) =
		if (shift> 26 ) then 
		encrypt(x::xs, shift mod 26)
		else 
		case (test(x, shift)) 
		of 
		(3)=> #" " :: encrypt(xs, shift) |
		(2)=> chr(ord(x) +shift - 26 ) :: encrypt(xs, shift) |
		(1)=> chr(ord(x) +shift + 26 ) :: encrypt(xs, shift) |
		(0)=> chr(ord(x) +shift) :: encrypt(xs, shift) |
		(_)=> nil;
	
	fun decrypt(message, shift:int) =
		encrypt(message, ~(shift mod 26));
	
	fun solve (message, ~1) = nil |
		solve (message, maxShiftValue:int) =
		String.explode("Caesar " ^Int.toString(maxShiftValue) ^": ") @ encrypt(message, maxShiftValue) @String.explode("\n") @ solve(message, maxShiftValue-1);
	in
	print(String.implode(encrypt(mess, 27)) ^ "\n" 
	^String.implode(decrypt(mess, 27)) ^ "\n"
	^String.implode(solve(mess, 27)) ^ "\n" )
	end;