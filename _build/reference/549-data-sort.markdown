### Data

> SORT array [USE cmpfunc]

Sorts an array. The cmpfunc if specified, takes 2 vars to compare and must return: -1 if x < y, +1 if x > y, 0 if x = y.


<pre>FUNC qscmp(x,y)
IF x=y
    qscmp=0
ELIF x>y
    qscmp=1
ELSE
    qscmp=-1
ENDIF
END
...
DIM A(5)
FOR i=0 TO 5
    A(i)=RND
NEXT
SORT A USE qscmp(x,y)

