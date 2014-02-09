subroutine encrypt(shift, message)
	INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: encryption
	! 32 = blank, char converts from int to char
	PRINT *, "...BEEP BOOP ENCRYPTING..."
	do while (shift > 26) 
	shift = MOD( shift, 26)
	end do
	print *, shift
	
	do i=0, len_Trim(message)
			tempC = message(i:i+1) 
			tempNum1 = IACHAR(tempC)
			!print *, tempC
			!print *, tempNum1
			
			if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +shift <=90) then 
				tempNum2 = tempNum1 +shift 
			else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +shift >90) then
				tempNum2 = tempNum1 + shift -26
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +shift <= 122) then
				tempNum2 = tempNum1 +shift
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +shift >122) then 
				tempNum2 = tempNum1 + shift -26
			else 
				tempNum2 = 32
			end if
			
			tempC = CHAR(tempNum2)
			!print *, tempC
			encryption(i:i+1) = tempC
			
	end do
	
	PRINT *, "ORIGINAL: ",  message
	PRINT *, "SECRET: ", encryption
end subroutine encrypt

subroutine decrypt (shift, message)
INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: decryption

	do while (shift > 26) 
	shift = MOD( shift, 26)
	end do
print *, shift

do i=0, len_Trim(message)
			tempC = message(i:i+1) 
			tempNum1 = IACHAR(tempC)
			!print *, tempC
			print *, tempNum1
			
			if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift <90) then 
				tempNum2 = tempNum1 -shift 
				! need -26 if over 90
			else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift >90) then
				tempNum2 = tempNum1 - shift +26
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift <= 122) then
				tempNum2 = tempNum1 -shift
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift >122) then 
				tempNum2 = tempNum1 - shift + 26
			else 
				tempNum2 = 32
			end if
			
			tempC = CHAR(tempNum2)
			!print *, tempC
			decryption(i:i+1) = tempC
			
	end do
	
	PRINT *, message
	PRINT *, decryption
end subroutine decrypt 
program hello

CHARACTER (LEN=*), PARAMETER:: test =  "A STRING FOR ALAN"
CHARACTER (LEN=*), PARAMETER:: test2 =  "a butt"

!call encrypt(1, test)
call encrypt(26*2 +1, test2)
call decrypt(100, "W XQPP")

end program hello
	   