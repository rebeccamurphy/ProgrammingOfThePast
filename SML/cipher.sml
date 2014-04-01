fun cipher() = 
(*sml cipher.sml cipher();*)
	let
	val mess  = "Royale with cheese"
	val mess2 = "Tbz xibu bhbjo Tbz xibu bhbjo J ebsf zpv J epvcmf ebsf zpv npuifsgvdlfs tbz xibu pof npsf Hpeebno ujnf"
	val mess3 = "what"
	fun test(m:int, shift)=
		if (m = ord (#" ")) then
			#" " (*space*)
		else if ((m + shift > 90 andalso m< 90) orelse (m+shift > 122)) then
			chr(m +shift - 26 ) (*upper/lower case over shift*)
		else if ((m + shift < 65 andalso m<90) orelse(m+shift<97 andalso m>=97)) then 
			chr(m +shift + 26 ) (*upper/lower case under shift*)
		else
			chr(m +shift); (*everything is fine*)

	fun encrypt2(nil, shift:int) = nil
	|	encrypt2(x::xs, shift:int) =
			if (shift> 26 ) then 
			encrypt2(x::xs, shift mod 26)
			else 
			test(ord(x), shift) :: encrypt2(xs, shift);
	
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