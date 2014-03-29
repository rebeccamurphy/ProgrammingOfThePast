fun cipher() = 
	let
	val mess= String.explode("a test for alan")
	fun upper(nil) =nil
			|upper(covert as x::xs) =
			if ord(x) >= 64 andalso ord(x) <= 90 then
			chr(ord(x)) :: upper(xs)
			else
			chr(ord(x) - 32) :: upper(xs);
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
		else if (test(x, shift) = 3) then 
		#" " :: encrypt(xs, shift)
		else if (test(x, shift) = 2) then 
		chr(ord(x) +shift - 26 ) :: encrypt(xs, shift)
		else if (test(x,shift) =1) then 
		chr(ord(x) +shift + 26 ) :: encrypt(xs, shift)
		else
		chr(ord(x) +shift) :: encrypt(xs, shift);
	
	fun decrypt(message, shift:int) =
		encrypt(message, ~(shift mod 26));
	
	in
	print(String.implode(encrypt(mess, 27)) ^ "\n" 
	^String.implode(decrypt(mess, 27)) ^ "\n") 
	(*print(String.implode(decrypt(mess, 27)) ^ "\n") *)
	end;