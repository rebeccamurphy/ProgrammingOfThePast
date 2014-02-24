program cipher;
var 
    test :string;
function encrypt(message :string; shift: integer): string; forward;
function decrypt(message :string; shift: integer): string; forward;
function encrypt(message :string; shift: integer): string;
        var (* local variable declaration *)
			encryption :string;
			tempShift : integer;
			charNum :integer;
			i: integer;
		begin 
            encryption := '';
			if (shift > -1) then 
			begin
			if (shift > 26) then
				tempShift := shift mod 26
			else 
				tempShift := shift;
				
			for i:=1 to length(message) do
				begin
					charNum := Ord(message[i]);
					if (charNum >= 65) and (charNum<=90) and (charNum + tempShift <=90) then 
						charNum := charNum +tempShift
					else if (charNum >= 65) and (charNum<=90) and (charNum +tempShift >90) then
						charNum := charNum + tempShift -26
					else if (charNum >=97) and (charNum<=122) and (charNum +tempShift <= 122) then
						charNum := charNum +tempShift
					else if (charNum >=97) and (charNum<=122) and (charNum +tempShift >122) then 
						charNum := charNum + tempShift -26
					else 
						charNum := charNum;
				encryption:= encryption+ Chr(charNum);
				end;
			encrypt := encryption;
			end
			else
			encrypt := decrypt(message, shift * -1);
		end;

function decrypt(message :string; shift: integer): string;
		var (* local variable declaration *)
			decryption :string;
			tempShift : integer;
			charNum :integer;
			i: integer;
		begin 
            decryption := '';
		if (shift > -1) then 
		begin
			if (shift > 26) then
				tempShift := shift mod 26
			else 
				tempShift := shift;
				
			for i:=1 to length(message) do
				begin
					charNum := Ord(message[i]);
					if (charNum >= 65) and (charNum<=90) and (charNum - tempShift >=65) then 
						charNum := charNum -tempShift
					else if (charNum >= 65) and (charNum<=90) and (charNum -tempShift <65) then
						charNum := charNum - tempShift +26
					else if (charNum >=97) and (charNum<=122) and (charNum -tempShift >= 97) then
						charNum := charNum -tempShift
					else if (charNum >=97) and (charNum<=122) and (charNum -tempShift <97) then 
						charNum := charNum - tempShift +26
					else 
						charNum := charNum;
				decryption:= decryption+ Chr(charNum);
				end;
			decrypt := decryption;
		end
		else
			decrypt := encrypt(message, shift * -1);
		end;
procedure solve(message:string; maxShiftValue:integer);
	var
		i:integer;
	begin
	for i := maxShiftValue downto 0 do
		begin
			writeln('Caesar ', i, ': ', encrypt(message, i));
		end;
	end;
	begin
	test:= 'A STRING FOR ALAN';
	writeln('..BEEP BOOP ENCRYPTING...');
	writeln();
	writeln('ORIGINAL: ', test);
	writeln('SECRET: ', encrypt(test, 100));
	writeln();
	
	writeln('..BOOP BEEP DECRYPTING...');
	writeln();
	
	writeln('ORIGINAL: ', 'XQPPO');
	writeln('SECRET: ', decrypt('XQPPO', 100));
	writeln();
	
	writeln('...BEEP SOLVING BOOP...');
	solve('hal', 26);
	
	end.
