
(defun I (X)
  ;I =  x.x identity
  ; but what if a list when through
    X
)

(defun K (X)
  ;K=  xy . x  =  x  y . x  take the first 
  (car X)
)

(defun Kprime (X)
  ;K' =  xy . y  take the 2nd
  (car (cdr X))
)

(defun S ( X Y Z)
  ;S =  x yz . xz (yz)substitution 
  (list X Z (list Y Z))
)  


(write-line (Kprime  (S "1" "2" "3" )) )
