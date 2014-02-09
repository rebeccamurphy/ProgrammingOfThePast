subroutine encrypt(shift, message)
	INTEGER :: shift
	CHARACTER (*), intent(inout) :: message
	INTEGER :: length
	CHARACTER :: tempC
	CHARACTER :: tempStr
	INTEGER :: tempNum
	CHARACTER (Len =len_Trim(message)) :: encryption
	!CHARACTER :: encryption
	length = len_Trim(message)
	print *, encryption
	
	
	
	! 32 = blank, char converts from int to char
	
	do i=0, length
			tempC = message(i:i+1) 
			tempNum = IACHAR(tempC)
			if (tempNum /= 32) then 
			tempNum = tempNum + shift
			end if
			tempC = CHAR(tempNum)
			print *, tempC
			encryption(i:i+1) = tempC
			
	end do
	
	PRINT *, message
	PRINT *, encryption
end subroutine encrypt

program hello

CHARACTER (LEN=*), PARAMETER:: test =  "A STRING FOR ALAN"

call encrypt(1, test)

end program hello
	   