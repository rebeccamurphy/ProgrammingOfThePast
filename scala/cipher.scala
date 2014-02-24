object cipher {
   def main(args: Array[String]) {
      println(encrypt("butt", 1))
   }
   
  def encrypt(message :String, shift: Int): String={
        var encryption :String="";
		var	tempShift : Int =0;
		var	charNum :Int =0;
		var	i: Int=1;
		

		
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
}
