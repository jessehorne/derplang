derplang
===========================
Derplang is a programming language designed by [Jesse Horne](jessehorne.github.io)

Documentation for the interpreter written in Lua
------------------------------------------------

Each 'function', string, new line, or or variable must be split using a colon(:).
Derplang can be compared to languages like Scheme. You have your procedures, which
take 'arguments'. ''procedure:arg:arg:arg''

You may see procedures that take three arguments. This means that the first
argument is the variable being set, and the others are being used by the procedure.

The implemented procedures are...
```
va - Variable declaration 	(va:x:1:)
ou - Output, like Print 	(ou:x:)
co - Concatenate strings 	(co:x:y:z:)
ad - Addition				(ad:x:y:z:)
su - Subtraction			(su:x:y:z:)
mu - Multiplication			(mu:x:y:z:)
di - Division				(di:x:y:z:)
fo - For loop				(fo:i:cmd:x:y:z:) The for loop is special, it does 'cmd' 'i' 
											  times and can take up to three arguments.
ip - Input 					(ip:x:) Puts input, into x similar to Lua's io.read()
la - Label 					(la:x:) Can be hopped to with 'go'
go - Goto a label 			(go:x:) Goto x (which is a label)
eq - If Equal				(eq:x:y:a:b:) If x == y goto a, if not, goto b
gt - If Greater than		(gt:x:y:a:b:) If x > y goto a, if not, goto b
lt - If Less than			(lt:x:y:a:b:) If x < y goto a, if not, goto b
ra - Set random value		(ra:x:y:z:) Set x to random value between y and z
```

Examples
----------

### Hello World
```
ou:Hello World:
```

### What's your name?
```
ou:What's your name?:ip:x:ou:x:
```

### 99 Bottles
```
va:x:100:la:start:su:x:x:1:ou:x:ou:bottles of beer!:eq:x:0:END:start:
```

http://esolangs.org/wiki/Derplang
