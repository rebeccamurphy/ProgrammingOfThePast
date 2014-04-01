fun cipher() = 
(*sml cipher.sml cipher();*)
	let
	val mess  = "Royale with cheese"
	val mess2 = "Tbz xibu bhbjo Tbz xibu bhbjo J ebsf zpv J epvcmf ebsf zpv npuifsgvdlfs tbz xibu pof npsf Hpeebno ujnf"
	val mess3 = "what"
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
	|	encrypt2(x::xs, shift:int) =
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
		String.implode(encrypt2(String.explode(message), shift));
		
	fun decrypt(message, shift:int) =
		encrypt(message, ~(shift mod 26));
	
	fun solve (message, ~1) = "\n" |
		solve (message, maxShiftValue:int) =
		"Caesar " ^Int.toString(maxShiftValue) ^": " ^ encrypt(message, maxShiftValue) ^"\n" ^ solve(message, maxShiftValue-1);
	in
	print( "\n" 
	^"...BEEP BOOP ENCRYPTING..." ^ "\n"
	^"SECRET:  " ^ mess ^ "\n"
	^"MESSAGE: " ^ encrypt(mess, 27) ^ "\n" ^ "\n" 
	^"...BOOP BEEP DECRYPTING..." ^ "\n" 
	^"SECRET:  " ^mess2 ^ "\n"
	^"MESSAGE: " ^ decrypt(mess2, 27) ^ "\n" ^ "\n" 
	^"...BEEP SOLVING BOOP..." ^ "\n" ^ solve(mess3, 26) ^ "\n" )
	end;