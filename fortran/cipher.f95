subroutine create (message, shift, flag)
	CHARACTER (*), intent(inout) :: message
	INTEGER :: shift
	INTEGER :: tempShift
	LOGICAL :: flag
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: encryption
	
	tempShift = shift
	if (shift> 26) then
	tempShift = MOD( shift, 26)
	end if
	
do i=0, len_Trim(message)
			tempC = message(i:i+1) 
			tempNum1 = IACHAR(tempC)
			
			if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +tempShift <=90) then 
				tempNum2 = tempNum1 +tempShift 
			else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +tempShift >90) then
				tempNum2 = tempNum1 + tempShift -26
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +tempShift <= 122) then
				tempNum2 = tempNum1 +tempShift
			else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +tempShift >122) then 
				tempNum2 = tempNum1 + tempShift -26
			else 
				tempNum2 = 32
			end if
			
			tempC = CHAR(tempNum2)
			encryption(i:i+1) = tempC
			
	end do
	if (flag .AND. shift >=10) then 
	PRINT *, "Caesar ", shift, ": ", encryption
	else if (flag) then 
	PRINT *, "Caesar ", shift, " : ", encryption
	else
	PRINT *, "SECRET:   ", encryption
	end if
	
end subroutine create

subroutine encrypt( message, shift)
	INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: encryption
	
	if (shift> 26) then
	shift = MOD( shift, 26)
	end if
	
	
	PRINT *," "
	PRINT *, "...BEEP BOOP ENCRYPTING..."
	PRINT *," "
	
	
	
	PRINT *, "ORIGINAL: ",  message
	call create( message, shift, .FALSE.)
end subroutine encrypt

subroutine decrypt (message, shift)
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
	
	if (shift> 26) then
	shift = MOD( shift, 26)
	end if
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

subroutine solve(message, maxShiftValue)
INTEGER :: maxShiftValue
CHARACTER (*), intent(inout) :: message

PRINT *," "
PRINT *, "...BEEP SOLVING BOOP..."
PRINT *," "

do i=maxShiftValue, 0, -1
	call create(message, i, .TRUE.)
end do

end subroutine solve

program cipher

CHARACTER (LEN=*), PARAMETER:: test =  "A STRING FOR ALAN"
CHARACTER (LEN=*), PARAMETER:: test2 =  "A STRING FOR MLADY"

call encrypt( test, 100)
call decrypt("XQPPO", 100)
call solve( "HAL", 27)
end program cipher
	   