;run with clisp -. (load 'cipher.lisp") (triple 3)
(defun test(chr)
	(let( (num (char-code chr))
		  (shifted (+ (char-code chr) shft))
		)
	(cond 
		((= num 32)
			(code-char 32))
		;(( M + Shift > 90 andalso M< 90) orelse ( M +Shift > 122))
		((or (and (> shifted 90) (< num 90)) (> shifted 122)) 	
			(code-char (+ shifted -26)))
		;(( M + Shift < 65 andalso M<90) orelse(M+Shift<97 andalso M>=97)) 
		((or (and (< shifted 65) (< num 90)) (and (< shifted 97) (> num 96))) 	
			(code-char(+ shifted 26)))
		(t  (code-char shifted))
		
	)
	)
)
(defun encrypt(message shift)
	(defvar shft shift)
	(if (> shift -1)
		(setf shft (mod shift 26))
		(setf shft shift); this is not being reached
	)
	(map 'string 'test message)
	)
(defun decrypt(message shift)
	(setf shift (- (mod shift 26)))
	(encrypt message shift)
	)
(defun solve (message shift)
	;why is there nil at the endddddd
	(if  (> shift -1)
		(concatenate 'string "Caesar " (write-to-string shift) ": " (encrypt message shift) "~%" (solve message (- shift 1)))
		
	)	
)
(defun main() 
	(let( (mess1 "Did you hear about the dyslexic, agnostic insomniac") 
		  (mess2 "If tubzfe vq bmm ojhiu xpoefsjoh jg uifsf xbt b eph")
		  (mess3 "HaHaHaHaHaHa")
		)
		(setf encryption (encrypt mess1 7))
		(setf decryption (decrypt mess2 1))
		(setf solution 	 (solve   mess3 7))
		(format t (concatenate 'string 
			"...BEEP BOOP ENCRYPTING..." "~%" "MESSAGE: " mess1 "~%" "SECRET:  " encryption "~%~%"
			"...BOOP BEEP DECRYPTING..." "~%"	"MESSAGE: "	mess2 "~%" "SECRET:  " decryption "~%~%" 
			"...BEEP SOLVING BOOP..." "~%" (solve mess3 26))
		)
	)
)
