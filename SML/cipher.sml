fun cipher() = 
	let
	val mess= String.explode("butt")
	fun upper(nil) =nil
			|upper(covert as x::xs) =
			if ord(x) >= 64 andalso ord(x) <= 90 then
			chr(ord(x)) :: upper(xs)
			else
			chr(ord(x) - 32) :: upper(xs);
	fun encrypt(nil, shift:int) = nil
		|encrypt(x::xs, shift:int) =
		if (shift> 26 ) then 
		chr(ord(x) +shift mod 26) :: encrypt(xs, shift mod 26)
		else
		chr(ord(x) +shift) :: encrypt(xs, shift);
	
	fun test(m:char, shift)=
		if (ord(m) + shift > 90) then
			2
		else if (ord(m) + shift < 65) then 
			1
		else
			0;
	in
	print(String.implode(encrypt(mess, ~1)) ^ "\n") 
	end;