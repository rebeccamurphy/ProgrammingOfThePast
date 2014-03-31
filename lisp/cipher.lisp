(defun triple (X)
  "Compute three times X."  ; Inline comments can
  (* 3 X))                  ; be placed here. nil is a thing car gets first element, cdr gets the rest
;comment? append adds lists together 
;run with (load 'cipher.lisp") (triple 3)
; setq is used to set variables also you can use '(1 2 3) instead of (list 1 2 3)
(defun factorial (N)
  "Compute the factorial of N."
  (if (= N 1)
      1
    (* N (factorial (- N 1)))))
(defun test(chr shift)
	(let( (num (char-code chr))
		  (shifted (+ (char-code chr) shift))
		)
	(cond 
		((= num 32)
			3)
		;(( M + Shift > 90 andalso M< 90) orelse ( M +Shift > 122))
		((or (and (< shifted 90) (> num 90)) (< shifted 122)) 	
			2)
		;(( M + Shift < 65 andalso M<90) orelse(M+Shift<97 andalso M>=97)) 
		((or (and (> shifted 65) (> num 90)) (and (> shifted 97) (< num 96))) 	
			1)
		(t 0)
		
	)
	)
)