; Inline comments can
;be placed here. nil is a thing car gets first element, cdr gets the rest
;comment? append adds lists together 
;run with (load 'cipher.lisp") (triple 3)
; setq is used to set variables also you can use '(1 2 3) instead of (list 1 2 3)
"(defvar fares '(31.14 28.12 25.10 22.08 19.06 16.04 13.02 10))

(defun plus-extra (fare) (+ 3.02 fare))
(map 'list 'plus-extra fares)
"
(defun test(chr)
	(let( (num (char-code chr))
		  (shifted (+ (char-code chr) shift))
		)
	(cond 
		((= num 32)
			(code-char 32))
		;(( M + Shift > 90 andalso M< 90) orelse ( M +Shift > 122))
		((or (and (> shifted 90) (< num 90)) (> shifted 122)) 	
			(code-char (+ shifted -26)))
		;(( M + Shift < 65 andalso M<90) orelse(M+Shift<97 andalso M>=97)) 
		((or (and (< shifted 65) (< num 90)) (and (< shifted 97) (> num 96))) 	
			1);(code-char(+ shifted 26)))
		(t  (code-char shifted))
		
	)
	)
)
(defun encrypt(message shft)
	(defvar shift shft)
	(setf shift shft)
	(map 'string 'test message)
	)