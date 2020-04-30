(in-package :maximization)

(extend-sharp-quote)

(defun argmax (key &rest args)
  "MAX function accompanied with a function that act as a :KEY keyword
   parameter in some sequence functions."
  (if args
    (find (apply #'max (mapcar key args)) args :key key)))

(defun maximize (seq test &optional (key #'identity))
  "The extended version of argmax (in math) that has the TEST function.
   Although KEY is not needed from the principall view point, it
   contributes for the clearer code in some cases. CL:SORT is used as
   the reference to decide the order of parameters.

   The TEST function should be a total order, at least if that is
   restricted to SEQ. Even if there is a maximum element of SEQ,
   MAXIMIZE may not work as it is intended if TEST function is not a
   total order since the order of comparison is not ruled at all.
    From the binary relational viewpoint, MAXIMIZE function returns the
   rightmost element of SEQ in the meaning of TEST. It goes without
   saying that the 2nd argument of TEST function (among its 2
   arguments) is the right argument of the binary relation TEST.

   An error will be raised if the length of SEQ is zero."
  (reduce #'(if (funcall test (funcall key a0) (funcall key a1)) a1 a0) seq))
