---
permalink: /778
layout: post
title:  "ENCLOSE"
categories: string
---
String

ENCLOSE (str[, pair])

Encloses a string.


? enclose("abc", "()")
' Result: (abc)

ENCLOSE defaults to double quotes if the [pair] option is not used.
<pre>

test=10
myStr="myStr"
? enclose(test)
? enclose(myStr)
pause

</pre>

