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
		
        if (shift > 26) 
			tempShift = shift % 26;
		else 
			tempShift = shift;
				
	    for (i <- 0 to message.length-1) 
				{
					charNum = message.charAt(i).toInt;
					if (charNum >= 65 && charNum<=90 && charNum + tempShift <=90) 
						charNum = charNum +tempShift;
					else if (charNum >= 65 && charNum<=90 && charNum +tempShift >90)
						charNum = charNum + tempShift -26;
					else if (charNum >=97 && charNum<=122 && charNum +tempShift <= 122) 
						charNum = charNum +tempShift;
					else if (charNum >=97 && charNum<=122 && charNum +tempShift >122) 
						charNum = charNum + tempShift -26;
					else 
						charNum = 32;
				encryption= encryption+ charNum.toChar;
			}
		return encryption;
   }

   def decrypt(message :String, shift: Int): String={
        var decryption :String="";
		var	tempShift : Int =0;
		var	charNum :Int =0;
	
		

		
        if (shift > 26) 
			tempShift = shift % 26;
		else 
			tempShift = shift;
				
	    for (i <- 0 to message.length-1) 
				{
					charNum = message.charAt(i).toInt;
					if (charNum >= 65 && charNum<=90 && charNum - tempShift >=65) 
						charNum = charNum -tempShift;
					else if (charNum >= 65 && charNum<=90 && charNum -tempShift < 65)
						charNum = charNum - tempShift +26;
					else if (charNum >=97 && charNum<=122 && charNum -tempShift >= 97) 
						charNum = charNum -tempShift;
					else if (charNum >=97 && charNum<=122 && charNum -tempShift < 97) 
						charNum = charNum - tempShift +26;
					else 
						charNum = 32;
				decryption= decryption+ charNum.toChar;
			}
		return decryption;
   }
   
}
