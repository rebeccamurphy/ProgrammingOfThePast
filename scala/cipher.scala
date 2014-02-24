object cipher {
   def main(args: Array[String]) {
   		var test:String ="A STRING FOR ALAN";
   		
   		println("..BEEP BOOP ENCRYPTING...");
		println(); 

		println("ORIGINAL: "+  test);
		println("SECRET: "  +encrypt(test, 100));

		println();
      	println("..BOOP BEEP DECRYPTING...");
		println();
		
		println("ORIGINAL: " + "XQPPO");
		println("SECRET: " +decrypt("XQPPO", 100));
		println();
	
		println("...BEEP SOLVING BOOP...");
		solve("hal", 26);
   }
   def solve(message:String, maxShiftValue:Int) :Unit = 
   {
   	/*
	*	Calls encrypt for every value between maxShiftValue and 0
   	*/
   		var i :Int = maxShiftValue;
   		while(i > -1 )
   		{	
   			println("Caesar " + i + ": "+ encrypt(message, i));
   			i-=1;
   		}
   }
  def encrypt(message :String, shift: Int): String={
        var encryption :String="";
		var	tempShift : Int =0;
		var	charNum :Int =0;
		
		if (shift > -1) // makes encrypt work with negatives, if the shift is negative calls decrypt with positive shift
		{
        if (shift > 26) 
			tempShift = shift % 26;
		else 
			tempShift = shift;
				
	    for (i <- 0 to message.length-1) 
				{
					charNum = message.charAt(i).toInt;
					if (charNum >= 65 && charNum<=90 && charNum + tempShift <=90)  //Checks if character is upperCase and can be shifted without wrap around
						charNum = charNum +tempShift;
					else if (charNum >= 65 && charNum<=90 && charNum +tempShift >90) //Checks if character is upperCase, but needs to be shifted with wrap around
						charNum = charNum + tempShift -26;
					else if (charNum >=97 && charNum<=122 && charNum +tempShift <= 122) //Checks if character is lowerCase, and can be shifted without wrap around
						charNum = charNum +tempShift;
					else if (charNum >=97 && charNum<=122 && charNum +tempShift >122) //Checks if character is lowerCase, but needs to be shifted with wrap around
						charNum = charNum + tempShift -26;
					else // if the character is not a letter, it is not shifted. So spaces and anything else are kept
						charNum = charNum; 
				encryption= encryption+ charNum.toChar;
			}
		return encryption;
		}
		else
			return decrypt(message, shift * -1);
   }	

   def decrypt(message :String, shift: Int): String={
        var decryption :String="";
		var	tempShift : Int =0;
		var	charNum :Int =0;
	
		
		if (shift > -1)
		{
        if (shift > 26) 
			tempShift = shift % 26;
		else 
			tempShift = shift;
				
	    for (i <- 0 to message.length-1) 
				{
					charNum = message.charAt(i).toInt;
					if (charNum >= 65 && charNum<=90 && charNum - tempShift >=65) //Checks if character is upperCase and can be shifted without wrap around
						charNum = charNum -tempShift;
					else if (charNum >= 65 && charNum<=90 && charNum -tempShift < 65) //Checks if character is upperCase, but needs to be shifted with wrap around
						charNum = charNum - tempShift +26;
					else if (charNum >=97 && charNum<=122 && charNum -tempShift >= 97) //Checks if character is lowerCase, and can be shifted without wrap around
						charNum = charNum -tempShift;
					else if (charNum >=97 && charNum<=122 && charNum -tempShift < 97) //Checks if character is lowerCase, but needs to be shifted with wrap around
						charNum = charNum - tempShift +26;
					else // if the character is not a letter, it is not shifted. So spaces and anything else are kept
						charNum = charNum;
				decryption= decryption+ charNum.toChar;
			}
		return decryption;
		}
		else
			return encrypt(message, shift * -1);
   }
   
}
