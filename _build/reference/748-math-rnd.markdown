### Math

> RND

Returns a random number from the range 0 to 1.

<pre>

' RND IFF and DEF.bas  SmallBASIC 0.12.2 [B+=MGA] 2016-03-24
' RND - returns a number from 0 to almost 1
' IFF - IFF(conditional statement to evaluate, return this if evaluates true, returns this if evaluates false) 
' DEF - one line function definition
FOR i=1 TO 20 'need a random true/false, subst 0 or 1 (or -1)  ;)
  ? IFF(rnd<.5,"True ","False ");   '<======================== RND and IFF
next
?:?
FOR i=1 TO 10  'need a random direction back and forth
  dir=IFF(RND<.5,-360*RND,360*RND)  '<======================== RND and IFF
  ? USING " ####.0000"; dir;
NEXT
?:?
'check distribution of random numbers between low and high (inclusive)
'here is that function
DEF rand(lo,hi)=(RND*(hi-lo+1))\\1+lo '<======================= RND and DEF
low=1100:high=1150
DIM a(low-1 TO high+1)
FOR i=1 to 1000
  index=rand(low,high)
  a(index)++
NEXT
total=0
FOR i=low-1 TO high+1
  ? i;":";a(i);", ";
  total+=a(i)
  IF i MOD 10=9 THEN ?
NEXT
?:? "total trials=";total
'result: pretty even spread between two numbers inclusive.
PAUSE

</pre>

