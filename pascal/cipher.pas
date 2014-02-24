program cipher;
var 
    test :string;
	
function encrypt(message :string; shift: integer): string;
		var (* local variable declaration *)
			encryption :string;
			tempShift : integer;
			charNum :integer;
			i: integer;
		begin 
			if (shift > 26) then
				tempShift := shift mod 26
			else 
				tempShift := shift;
				
			for i:=1 to length(message) do
				begin
					charNum := Ord(message[i]);
					if (charNum >= 65 and charNum<=90 and charNum + tempShift <=90) then 
						charNum = charNum +tempShift
					else if (charNum >= 65 and charNum<=90 and charNum +tempShift >90) then
						charNum = charNum + tempShift -26
					else if (charNum >=97 and charNum<=122 and charNum +tempShift <= 122) then
						charNum = charNum +tempShift
					else if (charNum >=97 and charNum<=122 and charNum +tempShift >122) then 
						charNum = charNum + tempShift -26;
					else 
						charNum = 32;
				appendstr(encryption, Chr(charNum));
				end;
			encrypt := encryption;
		end;
	begin
	writeln(encrypt('ABC', 1))
	end.