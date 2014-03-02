program cipher;
(*Rebecca Murphy
	This program can be tested with uppercase/lowercase strings
	as well as negative/positive shifts.
	Symbols are not changed.*)
var 
    test :string;
(*the forward keyword allows the functions to call eachother*)
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
		if (shift > -1) then  (*if positive shift encrypt normally*)
		begin
		if (shift > 26) then (*reduces shift if necessary*)
			tempShift := shift mod 26
		else 
			tempShift := shift;
			
		for i:=1 to length(message) do (*loops through message*)
		begin
		charNum := Ord(message[i]); 
		(*charNum is setto the ord # of char at i in message*)
		
		(*uppercase shift*)
		if (charNum >= 65) and (charNum<=90) and (charNum + tempShift <=90) then 
			charNum := charNum +tempShift
		else if (charNum >= 65) and (charNum<=90) and (charNum +tempShift >90) then
			charNum := charNum + tempShift -26
		(*lowercase shift*)	
		else if (charNum >=97) and (charNum<=122) and (charNum +tempShift <= 122) then
			charNum := charNum +tempShift
		else if (charNum >=97) and (charNum<=122) and (charNum +tempShift >122) then 
			charNum := charNum + tempShift -26
		(*Symbol shift*)
		else 
			charNum := charNum; (*keeps charNum the same*)
		encryption:= encryption+ Chr(charNum); (*adds shifted char to encryption*)
		end;
		encrypt := encryption;(*returns encryption*)
		end
		else(*if shift <0, return decrypt value of the message, with the absolute value of shift*)
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
	if (shift > -1) then (*decrypts normally if shift is >-1*)
	begin
	if (shift > 26) then (*checks if shift needs to be reduced*)
		tempShift := shift mod 26
	else 
		tempShift := shift;
		
	for i:=1 to length(message) do
		begin
		charNum := Ord(message[i]);
		(*uppercase shift*)
		if (charNum >= 65) and (charNum<=90) and (charNum - tempShift >=65) then 
			charNum := charNum -tempShift
		else if (charNum >= 65) and (charNum<=90) and (charNum -tempShift <65) then
			charNum := charNum - tempShift +26
		(*lowercase shift*)
		else if (charNum >=97) and (charNum<=122) and (charNum -tempShift >= 97) then
			charNum := charNum -tempShift
		else if (charNum >=97) and (charNum<=122) and (charNum -tempShift <97) then 
			charNum := charNum - tempShift +26
		(*symbol shift*)
		else 
			charNum := charNum;
		decryption:= decryption+ Chr(charNum);
		end;
	decrypt := decryption; (*returns decryption*)
	end
	else (*if shift is <0 return result of decrypt with message and absolute value of shift*)
		decrypt := encrypt(message, shift * -1);
	end;
procedure solve(message:string; maxShiftValue:integer);
	var
		i:integer;
	begin
	for i := maxShiftValue downto 0 do (*loops from maxShiftValue to 0*)
		begin
			(*calls encrypt for every loop and prints result*)
			writeln('Caesar ', i, ': ', encrypt(message, i)); 
		end;
	end;
	begin
	test:= 'A STRING FOR ALAN';
	writeln('..BEEP BOOP ENCRYPTING...');
	writeln();
	writeln('ORIGINAL: ', test);
	writeln('SECRET:   ', encrypt(test, 100));
	writeln();
	
	writeln('..BOOP BEEP DECRYPTING...');
	writeln();
	
	writeln('ORIGINAL: ', 'bpqa qa i bmab abzqvo nzwu itiv');
	writeln('SECRET:   ', decrypt('bpqa qa i bmab abzqvo nzwu itiv', 8));
	writeln();
	
	writeln('...BEEP SOLVING BOOP...');
	solve('hal', 26);
	
	end.
