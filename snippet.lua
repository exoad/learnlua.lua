
----------------------------------
--  Journey to speed learn Lua  --
-- Created by Jack Meng (exoad) --
----------------------------------

--[[
  Extra Materials:
      1) https://www.lua.org/manual/5.1/manual.html
]]

------------------------
--[[ SECTION BASICS ]]--
------------------------
--[[

  This is a comment, comments come in single line and multiline, all of which will
  be ignored during runtime.

  This is a multiline comment which starts with --[[ and ends with two "]"
]] -- This is a single line comment, start a line with "--" and the statements after that line will be counted as comments.

print() --[[
  The print() function is primitive Input/Output function in Lua.

  By running it with print() no arguments, nothing is printed.

  By running it with arguments like print("Hello World") -> Hello World will be printed to the
]]


-----------------------
--[[ SECTION TYPES ]]--
-----------------------
type() --[[
  The type() function is primitive to get the type of the argument.

  By running it with an argument like type("Hello") it outputs "String" because "Hello" is a String

  type(0)      -> Number
  type(true)   -> Boolean
  type(nil)    -> nil
  type("Tree") -> String
]]

print(nil)
print(type(nil)) --[[
  nil represents the absence of type.

  Using print(type()) in conjunction allows you to print the type of said value to STDOUT

  Think of it as "null" in some other languages
]]

print(1)
print(3)
print(1.3)
print(-3) --[[
  These are "Number" types. Numbers can be negative, floating point, positive, integer, aka number;
]]

print("Hello world")
print("Hi!") --[[
  These are "String" types. Which can be enclosed with double quotes("") or single quotes('')
]]

print(true)
print(false) --[[
  These are booleans, which represent two binary values "true" or "false"
]]


---------------------------
--[[ SECTION VARIABLES ]] --
---------------------------
myVariable = nil --[[
  Declaring variable follows the format of:

  variableName = typeValue
    -variableName is the literal variable's name
        a.) Can contain numbers, letters, and underscores
        b.) Cannot start with a number (0-9)
    -typeValue is the value to set the variable to
        a.) This value is a value associated to a type, for example "myVariable = 123" would mean myVariable
            holds a "Number" type with value 123

  When you are unsure of the starting value, always declare the variable to "nil"

  - Variables may be reassigned for example:

      var_a = 1
      var_b = 3
      var_a = var_b <- Here var_a would have a value of 3 and var_b with a value of 3

]]

print(myVariable)
type(myVariable) --[[
  Using variables in functions is as simple as passing their name into a function
]]

tonumber() --[[
  This is a handy method for when you want to convert something to a
  Number type (String-Number or Number). If it can't it would return "nil"

  For example
      tonumber("HI") -> nil
      tonumber("32") -> 32
]]

tostring() --[[
  This is a handy method to convert the argument to a String format.

  For example
    tostring(false) -> "false"
    tostring(nil)   -> "nil"
]]


-----------------------------------------
--[[ SECTION ARITHMETICS & Operations]]--
-----------------------------------------
--[[
  Basic Arithmetics can be used on Number types and between Number types but never between
  any other.

  Operators can be used between variables or raw values.

  Operators are:

  + -> For addition                       | 2+3    => 5
  - -> For subtraction                    | 2-3    => -1
  * -> For multiplication                 | 2*3    => 6
  / -> For division                       | 2/3    ~> 0.67
  ^ -> For exponent (power) [NOT BIT XOR] | 2^3    => 8
  % -> For remainder (modulo)             | 2%3    => 2
  - -> For value Negation                 | -(2+3) => -5

  THERE ARE NO POSTFIX OPERATORS IN LUA (i++, c--, ++a, ++b), thus you have to do (for maybe incrementation by 1):
    my_Var = my_Var + 1

  Operator Precedence (highest [top] to lowest [bottom])
  "^"
  "not"
  "*","/"
  "+","-"
  "<",">","<=","=>","==","~="
  "and"
  "or"

  [!] Same operator precendence at the same level is executed based on their placement from left to right

]]

print("Hello World" .. "Its me") --[[
    String concat, or adding two strings together is accomplished using the ".." operator

    Using this operation you can also "coerce" other types to a "String", take for example:

        var_Num = 3
        print("My Number: " .. varNum) <- Effectively coerce "var_Num" to be a String via String concat
]]

print("Hello World" + "its me") --[[
  String concat can also be achieved via the "+" addition operator and also has the same effects
  as ".."

  However, remember that when both sides are numbers, the standard addition operation is performed.

  Note:
      print(1 .. 3) -> 13
      print(1 + 3)  -> 4
]]

--------------------------------------
--[[SECTION CONTROLS & CONDITIONS ]]--
--------------------------------------
myBool = true
myVar = 3

if myBool then -- Note for boolean expressions, we don't have to do "myBool == true", you can, but is less concise
  print("I AM HUNGRY")
end --[[
  The most basic conditional statement is the "if" which follows the following format:

      if boolean-condition then <- If condition declaration
        todo                    <- Statement to run on boolean condition for true
      end                       <- Marks the end of this case
    -If "boolean-condition" is true, then the "todo" code runs
  In the above code snippet, since "myBool" is true, then the program will print "I AM HUNGRY"
]]

if myBool then
  print("I am hungry")
else
  print("I am not hungry")
end --[[
  When we want to introduce a "default" case, we add the else keyword for when the other conditions fail.

    There can only be one else statement per conditional statement

  [!] Note that the "else" statement does not utilize a "then" keyword
]]

if myVar == 2 then
  print("2")
elseif myVar >= 3 then
  print(">=3")
else
  print("?")
end --[[
  We can add intermediate conditional cases using the "elseif [expr] then" expression
  which is just an "if" statement but renamed.

  Processing this conditional block goes from top to bottom.

  We could've also ended the entire conditional block at the "else-if" with an "end" and not include a
  default "else" case
]]

if myVar == 2 then
  print("My var is 2!!")
end --[[
  Conditional operators are used to validate certain things. They are parsed as "boolean expressions" that
  express "booleans".

  Here are all of the conditional operators in Lua:
    X > Y  -> X greater than Y
    X >= Y -> X greater than or equal to Y
    X < Y  -> X smaller than Y
    X <= Y -> X smaller than or equal to Y
    X == Y -> X equals Y
    X ~= Y -> X does not equal Y

]]

if not myVar == 3 then
  print("Not 2")
elseif myBool and myVar == 2 then
  print("Both!")
elseif not myBool or myVar == 2 then
  print("Maybe")
else
  print("?")
end --[[
  Lua also provides conditional operators:
    not
    and
    or

  -"not" we simply evaluate -> "not X" expresses to "true" if X is "false" and vice versa
  -"and" we simply require both sides of the expression to evaluate to true before the statement is fully evaluated as "true"
  -"or" we simply require only one side of the expression to evaluate to true before the statement is fully evaluated as "true"

  [!] Note when we ever "not" a Number or String, Lua always returns "false"
]]

if myVar and (not true or myVar == 3) then

end --[[
  Take this hypothetical piece of conditional statement.

  Since operations/operators have precendence, we can use "()" to group expression to make them
  be evaluated first, thus increasing their precendence artifically.

  This format also increases readability
]]

