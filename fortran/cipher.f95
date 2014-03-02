program cipher
! Rebecca Murphy
! This program works with uppercase and lower case, but not with negative shifts. 
! Symbols are kept in the message
CHARACTER (LEN=*), PARAMETER:: test =  "A STRING FOR ALAN"
CHARACTER (LEN=*), PARAMETER:: test2 =  "bpqa qa i bmab abzqvo nzwu itiv"

call encrypt( test, 8)
call decrypt( test2, 8)
call solve( "HAL", 26)

end program cipher

subroutine create (message, shift, flag)
	! created so I won't have to copy encrypt into solve, or change print statements
	! if flag is false, print messages will be for encrypt
	! if flag is true, print messages will be for solve
	CHARACTER (*), intent(inout) :: message 
	!assumes length of message
	INTEGER :: shift
	INTEGER :: tempShift
	LOGICAL :: flag
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum1
	INTEGER :: tempNum2
	CHARACTER (Len =len_Trim(message)) :: encryption 
	!encryption is made with the length of message
	
	tempShift = shift 
	!keeps shift at original value, uses tempShift instead
	if (shift> 26) then !reduces tempShift if necessary
	tempShift = MOD( shift, 26)
	end if
	
do i=0, len_Trim(message) !loops through message char by char
	tempC = message(i:i+1) !tempC = char at i
	tempNum1 = IACHAR(tempC) !tempNum1 = ord # of tempC
		!uppercase shift
		if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +tempShift <=90) then 
			tempNum2 = tempNum1 +tempShift 
		else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 +tempShift >90) then
			tempNum2 = tempNum1 + tempShift -26
		!lowercase shift
		else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +tempShift <= 122) then
			tempNum2 = tempNum1 +tempShift
		else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 +tempShift >122) then 
			tempNum2 = tempNum1 + tempShift -26
		!symbol shift
		else 
			tempNum2 = tempNum1 !if char is not a letter, it does not change
		end if
	tempC = CHAR(tempNum2) !tempC is set to new shifted character
	encryption(i:i+1) = tempC	!tempC is set to the position it had in message, in encryption
end do
	if (flag .AND. shift >=10) then !the extra condition just lines up the numbers
	PRINT *, "Caesar ", shift, ": ", encryption
	else if (flag) then 
	PRINT *, "Caesar ", shift, " : ", encryption
	else
	PRINT *, "SECRET:   ", encryption
	end if
	
end subroutine create

subroutine encrypt( message, shift)
	!calls create with flag to do the actual conversion
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
	
	if (shift> 26) then	!checks if shift needs to be reduced
	shift = MOD( shift, 26)
	end if
do i=0, len_Trim(message)
	tempC = message(i:i+1)  !tempC = char at i in message
	tempNum1 = IACHAR(tempC)!tempNum1 = ord # tempC
	
	!uppercase shift
	if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift >=65) then 
		tempNum2 = tempNum1 -shift 
	else if (tempNum1 >= 65 .AND. tempNum1<=90 .AND. tempNum1 -shift< 65) then
		tempNum2 = tempNum1 - shift +26
	
	!lowercase shift
	else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift >= 97) then
		tempNum2 = tempNum1 -shift
	else if (tempNum1 >=97 .AND. tempNum1<=122 .AND. tempNum1 -shift <97) then 
		tempNum2 = tempNum1 - shift + 26
	
	!symbol shift	
	else 
		tempNum2 = tempNum1
	end if
	
	tempC = CHAR(tempNum2) !tempC is set to the new shifted char value
	decryption(i:i+1) = tempC !tempC is added to encryption
			
end do
	
	PRINT *, "ORIGINAL: ",  message
	PRINT *, "SECRET:   ", decryption
end subroutine decrypt 

subroutine solve(message, maxShiftValue)
! basically calls create with flag to do most of the work
INTEGER :: maxShiftValue
CHARACTER (*), intent(inout) :: message

PRINT *," "
PRINT *, "...BEEP SOLVING BOOP..."
PRINT *," "

do i=maxShiftValue, 0, -1
	call create(message, i, .TRUE.)
end do

end subroutine solve


	   