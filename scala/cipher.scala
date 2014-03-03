object cipher {
	/**
	*	Rebecca Murphy
	*	This program can work with upper/lower case strings, and negative shifts.
	*	Symbols are not shifted, they remain where they were in the original string.
	*/

   def main(args: Array[String]) {
   		var test:String ="A STRING FOR ALAN";
   		
   		println(); 
   		println("..BEEP BOOP ENCRYPTING...");
		println(); 

		println("ORIGINAL: "+  test);
		println("SECRET:   "  +encrypt(test, 100));

		println();
      	println("..BOOP BEEP DECRYPTING...");
		println();
		
		println("ORIGINAL: " + "bpqa qa i bmab abzqvo nzwu itiv");
		println("SECRET:   " +decrypt("bpqa qa i bmab abzqvo nzwu itiv", 8));
		println();
	
		println("...BEEP SOLVING BOOP...");
		println();
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
		i = i -1 ;
	}
   }
  def encrypt(message :String, shift: Int): String={
    var encryption :String="";
	var	tempShift : Int =0;
	var	charNum :Int =0;
	
	if (shift > -1) 
	// makes encrypt work with negatives, if the shift is negative calls decrypt with positive shift
	{
    if (shift > 26) 
		tempShift = shift % 26;
	else 
		tempShift = shift;
			
    for (i <- 0 to message.length-1) 
	{
	charNum = message.charAt(i).toInt;

	//Checks if character is upperCase and can be shifted without wrap around
	if (charNum >= 65 && charNum<=90 && charNum + tempShift <=90)  
		charNum = charNum +tempShift;

	//Checks if character is upperCase, but needs to be shifted with wrap around	
	else if (charNum >= 65 && charNum<=90 && charNum +tempShift >90) 
		charNum = charNum + tempShift -26;

	//Checks if character is lowerCase, and can be shifted without wrap around	
	else if (charNum >=97 && charNum<=122 && charNum +tempShift <= 122)
		charNum = charNum +tempShift;
	
	//Checks if character is lowerCase, but needs to be shifted with wrap around
	else if (charNum >=97 && charNum<=122 && charNum +tempShift >122) 
		charNum = charNum + tempShift -26;

	// if the character is not a letter, it is not shifted. So spaces and anything else are kept	
	else 
		charNum = charNum; 
	encryption = encryption + charNum.toChar;
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
	
	//Checks if character is upperCase and can be shifted without wrap around
	if (charNum >= 65 && charNum<=90 && charNum - tempShift >=65) 
		charNum = charNum -tempShift;
	
	//Checks if character is upperCase, but needs to be shifted with wrap around
	else if (charNum >= 65 && charNum<=90 && charNum -tempShift < 65) 
		charNum = charNum - tempShift +26;

	//Checks if character is lowerCase, and can be shifted without wrap around	
	else if (charNum >=97 && charNum<=122 && charNum -tempShift >= 97) 
		charNum = charNum -tempShift;
	
	//Checks if character is lowerCase, but needs to be shifted with wrap around
	else if (charNum >=97 && charNum<=122 && charNum -tempShift < 97) 
		charNum = charNum - tempShift +26;
 	
 	// if the character is not a letter, it is not shifted. So spaces and anything else are kept
	else
		charNum = charNum;
	decryption = decryption + charNum.toChar;
	}
	return decryption;
	}
	else
	return encrypt(message, shift * -1);
   }
   
}
