subroutine encrypt(shift, message)
	INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: encryption
	
	PRINT *," "
	PRINT *, "...BEEP BOOP ENCRYPTING..."
	PRINT *," "
	
	do while (shift > 26) 
	shift = MOD( shift, 26)
	end do
	
	do i=0, len_Trim(message)
			tempC = message(i:i+1) 
			tempNum1 = IACHAR(tempC)
			
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
			encryption(i:i+1) = tempC
			
	end do
	
	PRINT *, "ORIGINAL: ",  message
	PRINT *, "SECRET:   ", encryption
end subroutine encrypt

subroutine decrypt (shift, message)
	INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: decryption
	
	PRINT *," "
	PRINT *, "...BOOP BEEP DECRYPTING..."
	PRINT *," "
	
	do while (shift > 26) 
	shift = MOD( shift, 26)
	end do
do i=0, len_Trim(message)
			tempC = message(i:i+1) 
			tempNum1 = IACHAR(tempC)
			
			if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift >=65) then 
				tempNum2 = tempNum1 -shift 
				! need -26 if over 90
			else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift< 65) then
				tempNum2 = tempNum1 - shift +26
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift >= 97) then
				tempNum2 = tempNum1 -shift
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift <97) then 
				tempNum2 = tempNum1 - shift + 26
			else 
				tempNum2 = 32
			end if
			
			tempC = CHAR(tempNum2)
			decryption(i:i+1) = tempC
			
	end do
	
	PRINT *, "ORIGINAL: ",  message
	PRINT *, "SECRET:   ", decryption
end subroutine decrypt 
program hello

CHARACTER (LEN=*), PARAMETER:: test =  "A STRING FOR ALAN"

call encrypt(100, test)
call decrypt(100, "W XQPP")

end program hello
	   