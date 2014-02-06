 FUNCTION func_name()
    CHARACTER (LEN=*) :: func_name
    func_name = "butt"
    RETURN
 END FUNCTION

program hello
CHARACTER (LEN=*), PARAMETER :: message =  "A STRING FOR ALAN"
CHARACTER (LEN=*), PARAMETER :: test =  "bug"
CHARACTER (LEN=*) :: func_name
PRINT *, func_name()

end program hello
	   