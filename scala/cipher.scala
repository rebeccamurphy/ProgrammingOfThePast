object cipher {//run with scala cipher.scala
 def test(m:Int, shift:Int):Char ={
 	if (m == 32)
 	    m.toChar;
 	else if ((m +shift > 90 && m < 90) || m+shift > 122)
     	(m  + shift - 26).toChar;
  else if ((m+shift < 65 && m < 90) || (m + shift < 97 && m >= 97))
    	(m + shift + 26).toChar;
  else
    	(m +shift).toChar;
     }

def encrypt2(message:List[Char], shift:Int):List[Char] ={
	if (shift > 26 || -shift >26 ) 
	encrypt2(message, shift % 26);
	else {
      message match {
        case head :: tail => 
        	test(head.toInt, shift) :: encrypt2(tail, shift);
        case Nil => Nil
      }
  }
}

def encrypt(message:String, shift:Int):String={
	encrypt2(message.toList, shift).mkString;
}
def decrypt(message:String, shift:Int):String = {
	encrypt(message, -shift).mkString;
}
def solve(message:String, maxShiftValue:Int):String ={
	maxShiftValue match {
	case -1 => "\n"
	case _ =>
	"Caesar " + maxShiftValue + " : " + encrypt(message, maxShiftValue) +"\n" + solve(message, maxShiftValue-1)
	}
}

def main(args: Array[String]) 
{
  println("...BEEP BOOP ENCRYPTING...");
  println("");
  println("MESSAGE: " + "What weighs six ounces, sits in a tree and is very dangerous");
	println("SECRET:  " + encrypt("What weighs six ounces, sits in a tree and is very dangerous", 1));
  println("");
	println("...BOOP BEEP DECRYPTING...");
  println("");
  println("MESSAGE: " + "B tqbsspx xjui b nbdijof hvo");
  println("SECRET:  " + decrypt("B tqbsspx xjui b nbdijof hvo", 27));
  println("");
  println("...BEEP SOLVING BOOP...");
	println(solve("na na na na na na na na na na na na na na na na BATMAAAN", 26));
}

}