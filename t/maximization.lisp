(in-package :maximization)

(defun alist-equal (x y)
  (and (subsetp x y :test #'equal)
       (subsetp y x :test #'equal)))

(and
  (let ((alist '((7 . x) (2 . y) (3 . z) (19 . a) (4 . b) (12 . c))))
    (and
      (= (projected-find-if #'(= _ 7) #'car alist) 7)
      (= (projected-find-if #'(= _ 19) #'car alist) 19)
      (= (projected-find-if #'(= _ 12) #'car alist) 12)
      (null (projected-find-if #'zerop #'car alist))
      (let ((failed (gensym)))
        (eq
          (projected-find-if #'zerop #'car alist failed)
          failed)))

    (equal (maximals alist #'<= #'car) '((19 . a)))

    ;;; We can use MAXIMALS in order to get maximum element of some groups.
    (alist-equal
      (maximals alist (lambda (x y) (and (= (mod x 2) (mod y 2)) (<= x y))) #'car)
      '((19 . a) (12 . c)))

    (alist-equal (maximals alist #'= #'car) alist))

  (equal (maximals "1307926" #'char<=) '(#\9))
