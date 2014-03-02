       IDENTIFICATION DIVISION.
       PROGRAM-ID. CIPHER.
       *> IDENTIFY BASICS ABOUT THE PROGRAM
       AUTHOR. REBECCA MURPHY. 
       *>THIS PROGRAM WORKS WITH UPPER/LOWER CASE BUT NOT NEGATIVE SHIFTS
       ENVIRONMENT DIVISION.
       *> WHAT ENVIRONMENT SPECIFICS IT SHOULD RUN IN
       DATA DIVISION. 
       *> CONTAINS THE DATA THE PROGRAM USES
       WORKING-STORAGE SECTION. 
       01 	THE-MESSAGE 	PIC X(50).
       01 	THE-MESSAGE2 	PIC X(50).
       01 	THE-MESSAGE3 	PIC X(50).
       01 	THE-SHIFT	PIC S9(3) SIGN LEADING SEPARATE.
       01 	THE-SHIFT2	PIC S9(3) SIGN LEADING SEPARATE.
       01 	THE-SHIFT3	PIC S9(3) SIGN LEADING SEPARATE.
       PROCEDURE DIVISION. *> MEAT OF PROGRAM 
       
       MOVE 8 TO THE-SHIFT.
       MOVE 8 TO THE-SHIFT2.
       MOVE 26 TO THE-SHIFT3.

       DISPLAY " ".

       MOVE "bpqa qa i. bmab abzqvo nzwu itiv" TO THE-MESSAGE.
       CALL "DECRYPT" USING BY CONTENT THE-MESSAGE, THE-SHIFT.

       DISPLAY " ".
       
       MOVE "this is a test string from alan" TO THE-MESSAGE2. 
       CALL "ENCRYPT" USING BY CONTENT THE-MESSAGE2, THE-SHIFT2.
  
       
       DISPLAY " ".
       
       MOVE "hal" TO THE-MESSAGE3. 
       CALL "SOLVE" USING BY CONTENT THE-MESSAGE3, THE-SHIFT3.
	     
       DISPLAY " ".

       STOP RUN.

	   IDENTIFICATION DIVISION.
	   PROGRAM-ID. DECRYPT.
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   01	TEMPC		PICTURE IS X(1).
	   01	CHARNUM1	PICTURE IS 9(3).
	   01	CHARNUM2	PICTURE IS 9(3).
	   01	I 			PICTURE IS 9(3).
	   01	LEN 		PICTURE IS 9(36).
	   01	SHIFTEDCN	PICTURE IS 9(3). *> SHIFTED CHARNNUM
	   01	A 			PICTURE IS 9(2).
	   01	Z 			PICTURE IS 9(2).
	   01	LA 			PICTURE IS 9(2). *>LOWERCASE A
	   01	LZ 			PICTURE IS 9(3). *>LOWERCASE Z
	   01 DECRYPTION 	PICTURE IS X(50).
	   LINKAGE SECTION.
	   01	SECRET PIC X(50). *>SECRET = THE-MESSAGE
	   01	SHIFT	 PIC S9(3) SIGN LEADING SEPARATE. *>SHIFT = THE-SHIFT
	   
	   PROCEDURE DIVISION USING SECRET, SHIFT. 
      *>COBOL HAS WEIRD ASCII VALUES, SO I DID NOT USE THE RAW NUMBERS
	   	MOVE FUNCTION ORD ("A") TO A.  *> HOLD THE VALUE OF ORD A. 
	   	MOVE FUNCTION ORD ("Z") TO Z.  *> HOLD THE VALUE OF ORD Z.
	   	MOVE FUNCTION ORD ("a") TO LA. *> HOLD THE VALUE OF ORD a
	   	MOVE FUNCTION ORD ("z") TO LZ. *> HOLD THE VALUE OF ORD z
		  MOVE 0 TO I.                   *>STARTS I COUNTER
   		MOVE LENGTH OF SECRET TO LEN.  *>GETS NUM OF TIMES TO RUN LOOP
   		IF SHIFT > 26 THEN *> CHECKS IF SHIFT NEEDS TO BE REDUCED
   			MOVE FUNCTION MOD (SHIFT, 26) TO SHIFT
   		END-IF

   		IF SHIFT < 0 THEN 
   			DISPLAY "INVALID"*> IF SHIFT IS NEGATIVE ENDS PROGRAM
   			EXIT PROGRAM.
   		PERFORM LEN TIMES *>STARTS TO LOOP THROUGH THE-MESSAGE
   			ADD 1 TO I 
        *> ARRAYS/STRINGS START AT 1 IN COBOL
   			MOVE SECRET(I:1) TO TEMPC 
        *>MOVES CHAR AT I TO TEMPC
   			MOVE FUNCTION ORD (TEMPC) TO CHARNUM1 
        *>STORES ORD OF TEMPC IN CHARNUM1
   			MOVE CHARNUM1 TO SHIFTEDCN 
   			SUBTRACT SHIFT FROM SHIFTEDCN 
        *> STORES THE SHIFTED VALUE OF CHARNUM1 TO SHIFTEDCN
   			MOVE CHARNUM1 TO CHARNUM2     
        *> COPIES CHARNUM1 TO CHARNUM2
        
        *>CAPS SHIFT
   			IF CHARNUM1 >= A AND CHARNUM1 <= Z THEN  
   				IF SHIFTEDCN >= A THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 	
   					MOVE SHIFTEDCN TO CHARNUM2
   					ADD 26 TO CHARNUM2
   				END-IF
   			END-IF
        *>LOWERCASE SHIFT
   			IF CHARNUM1 >= LA AND CHARNUM1 <= LZ THEN 
   				IF SHIFTEDCN >= LA THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 
   					MOVE SHIFTEDCN TO CHARNUM2
   					ADD 26 TO CHARNUM2
   				END-IF
   			END-IF
        *> SYMBOL SHIFT. SYMBOLS ARE REPLACED WITH SPACES
   			IF CHARNUM1 = CHARNUM2 AND SHIFT NOT=26 THEN 
				MOVE FUNCTION ORD (" ") TO CHARNUM2
			  END-IF
			MOVE FUNCTION CHAR (CHARNUM2) TO TEMPC 
      *> STORES SHIFTED CHAR IN TEMPC
	MOVE FUNCTION CONCATENATE (TEMPC, DECRYPTION ) TO DECRYPTION 
      *> ADDS TEMPC TO DECRYPTION 
   		END-PERFORM
   		
   		MOVE FUNCTION REVERSE(DECRYPTION ) TO DECRYPTION 
      *>CONCAT CREATE DECRYPTION BACKWARDS, SO IT NEEDS TO BE REVERSED
   		MOVE FUNCTION TRIM (DECRYPTION ) TO DECRYPTION 
      *> TRIMS THE LEADING SPACES
   		DISPLAY "...BOOP BEEP DECRYPTING..."
   		DISPLAY " ".
   		DISPLAY "ORIGINAL: ", SECRET
   		DISPLAY "SECRET:   ",  DECRYPTION 
   		EXIT PROGRAM. 
	   END PROGRAM DECRYPT.

	   IDENTIFICATION DIVISION.
	   PROGRAM-ID. ENCRYPT.
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   01	TEMPC		PICTURE IS X(1).
	   01	CHARNUM1	PICTURE IS 9(3).
	   01	CHARNUM2	PICTURE IS 9(3).
	   01	I 			PICTURE IS 9(3).
	   01	LEN 		PICTURE IS 9(36).
	   01	SHIFTEDCN	PICTURE IS 9(3). *> SHIFTED CHARNUM 
	   01	A 			PICTURE IS 9(2).
	   01	Z 			PICTURE IS 9(2).
	   01	LA 			PICTURE IS 9(2).   *> LOWERCASE A
	   01	LZ 			PICTURE IS 9(3).   *> LOWERCASE Z
	   01 ENCRYPTION  	PICTURE IS X(50).
	   LINKAGE SECTION.
	   01	SECRET		PICTURE IS X(50).  *> SECRET = THE-MESSAGE
	   01	SHIFT	PIC S9(3) SIGN LEADING SEPARATE. *> SHIFT = THE-MESSAGE
	   
	   PROCEDURE DIVISION USING SECRET, SHIFT. 
      *>COBOL HAS WEIRD ASCII VALUES, SO I DID NOT USE THE RAW NUMBERS
	   	MOVE FUNCTION ORD ("A") TO A.  *> HOLD THE VALUE OF ORD A.
	   	MOVE FUNCTION ORD ("Z") TO Z.  *> HOLD THE VALUE OF ORD Z.
	   	MOVE FUNCTION ORD ("a") TO LA. *> HOLD THE VALUE OF ORD a
	   	MOVE FUNCTION ORD ("z") TO LZ. *> HOLD THE VALUE OF ORD z
       MOVE 0 TO I.    *>STARTS I COUNTER
   		 MOVE LENGTH OF SECRET TO LEN.  
       *>LEN IS THE NUMBER OF TIMES TO RUN LOOP
   		IF SHIFT > 26 THEN             
      *>CHECKS IF SHIFT NEEDS TO BE REDUCED
   			MOVE FUNCTION MOD (SHIFT, 26) TO SHIFT
   		END-IF
   		IF SHIFT < 0 THEN 
   			DISPLAY "INVALID" *>IF SHIFT IS NEGATIVE END PROGRAM
   			EXIT PROGRAM.
   		
   		PERFORM LEN TIMES *> STARTS TO LOOP THROUGH SECRET
   			ADD 1 TO I 
        *>INCREMENTS COUNTER/ARRAYS AND STRINGS START AT 1
   			MOVE SECRET(I:1) TO TEMPC 
        *> STORES CHAR AT I IN SECRET IN TEMPC
   			MOVE FUNCTION ORD (TEMPC) TO CHARNUM1  
        *> STORES ORD OF TEMPC IN CHARNUM1
   			MOVE CHARNUM1 TO SHIFTEDCN
   			ADD SHIFT TO SHIFTEDCN 
        *> STORES SHIFTED VALUE OF CHARNUM1 TO SHIFTEDCN
   			MOVE CHARNUM1 TO CHARNUM2 
        *> COPIES CHARNUM1 TO CHARNUM2
        
        *>CAPS SHIFT
   			IF CHARNUM1 >= A AND CHARNUM1 <= Z THEN 
   				IF SHIFTEDCN <= Z THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 	
   					MOVE SHIFTEDCN TO CHARNUM2
   					SUBTRACT 26 FROM CHARNUM2
   				END-IF
   			END-IF
      *> LOWERCASE SHIFT
   			IF CHARNUM1 >= LA AND CHARNUM1 <= LZ THEN 
   				IF SHIFTEDCN <= LZ THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 
   					MOVE SHIFTEDCN TO CHARNUM2
   					SUBTRACT 26 FROM CHARNUM2
   				END-IF
   			END-IF
      *>SYMBOL SHIFT. SYMBOLS ARE REPLACED WITH SPACES
   			IF CHARNUM1 = CHARNUM2 AND SHIFT NOT=26 THEN 
				MOVE FUNCTION ORD (" ") TO CHARNUM2
			END-IF
			MOVE FUNCTION CHAR (CHARNUM2) TO TEMPC 
      *> STORES CHAR VALUE OF SHIFTED CHAR IN TEMPC
	MOVE FUNCTION CONCATENATE (TEMPC, ENCRYPTION ) TO ENCRYPTION  
  *> ADDS TEMPC TO ENCRYPTION 
   		END-PERFORM
   		
   		MOVE FUNCTION REVERSE(ENCRYPTION ) TO ENCRYPTION 
       *> CONCAT CREATES DECRYPTION BACKWARDS, SO IT NEEDS TO BE REVERSED
   		MOVE FUNCTION TRIM (ENCRYPTION ) TO ENCRYPTION  
      *> TRIM LEADING SPACES
   		DISPLAY "...BEEP BOOP ENCRYPTING..."
   		DISPLAY " ".
   		DISPLAY "ORIGINAL: ", SECRET
   		DISPLAY "SECRET:   ",  ENCRYPTION 
   		EXIT PROGRAM. 
	   END PROGRAM ENCRYPT.


	   IDENTIFICATION DIVISION.
	   PROGRAM-ID. SOLVE.
      *> THIS PROGRAM IS BASICALLY ENCRYPT IN A LOOP 
	   DATA DIVISION.
	   WORKING-STORAGE SECTION.
	   01	TEMPC		PICTURE IS X(1).
	   01	CHARNUM1	PICTURE IS 9(3).
	   01	CHARNUM2	PICTURE IS 9(3).
	   01	I 			PICTURE IS 9(3).
	   01	SHIFTCOUNT	PICTURE IS 9(3). *>KEEPS TRACK URRENT CAESAR #
	   01	LEN 		PICTURE IS 9(36).
	   01	SHIFTEDCN	PICTURE IS 9(3).
	   01	A 			PICTURE IS 9(2).
	   01	Z 			PICTURE IS 9(2).
	   01	LA 			PICTURE IS 9(2).
	   01	LZ 			PICTURE IS 9(3).
	   01 ENCRYPTION  	PICTURE IS X(50).
	   LINKAGE SECTION.
	   01	SECRET		PICTURE IS X(50).
	   01	MAXSHIFT PIC S9(3) SIGN LEADING SEPARATE.
	   
	   PROCEDURE DIVISION USING SECRET, MAXSHIFT. 
	   	MOVE FUNCTION ORD ("A") TO A.
	   	MOVE FUNCTION ORD ("Z") TO Z.
	   	MOVE FUNCTION ORD ("a") TO LA. *> a
	   	MOVE FUNCTION ORD ("z") TO LZ. *> z
		MOVE 0 TO I.
		MOVE MAXSHIFT TO SHIFTCOUNT. 
      *>STARTS SHIFTCOUNT AT MAXSHIFT
   		MOVE LENGTH OF SECRET TO LEN. 

   		DISPLAY "...BEEP SOLVING BOOP...".
   		DISPLAY " ".
   		IF MAXSHIFT < 0 THEN 
   			DISPLAY "INVALID"
   			EXIT PROGRAM.
		PERFORM MAXSHIFT TIMES *> LOOPS MAXSHIFT TIMES
   		PERFORM LEN TIMES 
   			ADD 1 TO I
   			MOVE SECRET(I:1) TO TEMPC
   			MOVE FUNCTION ORD (TEMPC) TO CHARNUM1
   			MOVE CHARNUM1 TO SHIFTEDCN
   			ADD SHIFTCOUNT TO SHIFTEDCN 
        *>USES SHIFTCOUNT INSTEAD OF SHIFT
   			MOVE CHARNUM1 TO CHARNUM2
   			IF CHARNUM1 >= A AND CHARNUM1 <= Z THEN 
   				IF SHIFTEDCN <= Z THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 	
   					MOVE SHIFTEDCN TO CHARNUM2
   					SUBTRACT 26 FROM CHARNUM2
   				END-IF
   			END-IF
   			IF CHARNUM1 >= LA AND CHARNUM1 <= LZ THEN 
   				IF SHIFTEDCN <= LZ THEN 
   					MOVE SHIFTEDCN TO CHARNUM2
   				ELSE 
   					MOVE SHIFTEDCN TO CHARNUM2
   					SUBTRACT 26 FROM CHARNUM2
   				END-IF
   			END-IF
   			IF CHARNUM1 = CHARNUM2 AND MAXSHIFT NOT=26 THEN 
				MOVE FUNCTION ORD (" ") TO CHARNUM2
			END-IF
			MOVE FUNCTION CHAR (CHARNUM2) TO TEMPC

	MOVE FUNCTION CONCATENATE (TEMPC, ENCRYPTION ) TO ENCRYPTION 
   		END-PERFORM
   		
   		MOVE FUNCTION REVERSE(ENCRYPTION ) TO ENCRYPTION 
   		MOVE FUNCTION TRIM (ENCRYPTION ) TO ENCRYPTION 
   		
   		DISPLAY "CAESAR ", SHIFTCOUNT, ": ", ENCRYPTION 
   		SUBTRACT 1 FROM SHIFTCOUNT 
      *> MOVES TO NEXT CAESAR NUMBER
   		MOVE " " TO ENCRYPTION  
      *> RESETS ENCRYPTION 
   		MOVE 0 TO I 
      *>RESETS I COUNTER
   		END-PERFORM
   		EXIT PROGRAM. 
	   END PROGRAM SOLVE.