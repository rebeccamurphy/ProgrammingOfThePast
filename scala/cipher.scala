object cipher {

 def test(m:Int, shift:Int):Int ={
 	if (m == 32)
 		3;
 	else if ((m +shift > 90 && m < 90) || m+shift > 122)
     	2;
    else if ((m+shift < 65 && m < 90) || (m + shift < 97 && m >= 97))
    	1;
    else
    	0;
     }

def encrypt2(message:List[Char], shift:Int):List[Char] ={
	if (shift > 26 || -shift >26 ) 
	encrypt2(message, shift % 26);
	else {
      message match {
      case head :: tail => 
      	test(head.toInt, shift) match {
      	case 3 => head ::encrypt2(tail, shift)
      	case 2 => (head.toInt +shift - 26).toChar :: encrypt2(tail, shift)
      	case 1 => (head.toInt +shift + 26).toChar :: encrypt2(tail, shift)
      	case 0 => (head.toInt +shift).toChar :: encrypt2(tail, shift)
  		}
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
	println("Hello World.");
	println(encrypt("butt", 27));
	println(decrypt("cvuu", 27));
	println(solve("cvuu", 26));
}
}