
----------------------------------
--  Journey to speed learn Lua  --
-- Created by Jack Meng (exoad) --
----------------------------------

--[[
  Extra Materials:
      1) https://www.lua.org/manual/5.1/manual.html
      2) http://lua-users.org/wiki/TutorialDirectory

  This guide covers the extense of most modern Lua dialects.
  Starting from 5.2
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

--[[
  Indentations and spacing are only enforced for specific codes and you will know when.
  For most of the time, indentation is not enforced while spacing between terms are enforced.

  My vocabulary:

  "raw-value" or "value" -> Literally raw values, like 1, 2, "3", "hello"
      -These are not variables
      -They can be return resultants from a function
  "variable" -> A raw value that has a name attached to it

  All reserved words & operators in Lua:
  and,break,do,else,elseif,and,false,for,function,if,in,local,nil,not,or,repeat,return,then
    true,until,while,+,-,*,/,%,^,#,==,~=,<=,>=,<,>,=,(,),{,},[,],;,:,,,.,..,...
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
    -The assignment operator "="
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


---------------------------------
--[[ SECTION DATA STRUCTURES ]]--
---------------------------------
myTable = {} --[[
  This is the only default data structure in Lua. This can be associated as an array or a table.

  When treated as a table, we use mostly non-numeric String based keys.

  When treated as an array, we use numeric based keys.

  [!] VERY IMPORTANT. REMEMBER THAT LUA TREATS THE FIRST INDEX OF A TABLE/ARRAY AS "1" NOT "0"

  There are no generic array types in Lua and thus we can mix both numeric and String based
  keyvalues in Lua.

  They are declared with "{}"

  We can access and manipulate content within the structure using keys. Done so by following
  the format:

    1| table[key] = value

    ^^^^^
    Notice the usage of the "[]" square brackets
]]
myTable["myIndex"] = 100 -- Key "myIndex" set to "100" in table "myTable"
myTable[1] = 20          -- Key "1" set to "20" in table "myTable"

--[[
  To access data, we use the same format, except now we don't use the assignment operator "="

  If no data is present with that key, Lua will return "nil".

  We can also delete values by just setting them to "nil"
]]
print(myTable[1]) -- 20 -> Based on what we set above
print(myTable["thisKeyExists?"]) -- nil -> We did not set anything for this key above

myTable.myIndex = 30 --[[
  This is the other method to select values, this is the same as:

    1| myTable["myIndex"]

  ^^^^
  Note this is not the same as myTable[myIndex]
]]

myTable2 = {first = 1, second = 2} --[[
  Initialization can be done so this way, which would be the same as:

      1| myTable2 = {["first"] = 1, ["second"] = 2}

]]

myArrayTable = {53, 34, 12} --[[
  This can also be declared as

      1| myArrayTable = {[1] = 53, [2] = 34, [3] = 12}

]]
print(myArrayTable[1]) -- Would print "53" because the first element is 53

print(#myArrayTable) --[[
  This gives us the length of all numerical keys (integer keys) in the array.

  The "#" operator for this operation:

    1| print(#{["hi"] = 1, 32, 4}) -- 2 Because "hi" is not numeric and will not be counted

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

        1| var_Num = 3
        2| print("My Number: " .. varNum) -- Effectively coerce "var_Num" to be a String via String concat

]]

print("Hello World" + "its me") --[[
  String concat can also be achieved via the "+" addition operator and also has the same effects
  as ".."

  However, remember that when both sides are numbers, the standard addition operation is performed.

  Note:
      print(1 .. 3) -> 13
      print(1 + 3)  -> 4
]]


-----------------------
--[[ SECTION SCOPE ]]--
-----------------------
--[[
  Scope can be defined as something's prevalence or visibility somewhere.

    Hypothetical code:

        1| var b
        2| block
        3|   var a
        4| end

    Variable "b" is alive from lines 1-4 while variable "a" is only alive within 2-3 (exclusive)

    In Lua, a variable without a scope modifier is referred to as a global variable.

    To avoid conflicts between naming we add the "local" scope modifier infront of a variable name:

      1| local myVariable = nil

    ^^^^
    Local variables only exist in their permitted block and nowhere else.

    [!] Every loop iteration and function call creates a new scope with new variables.
    [!] Generally you want to use "local" specifiers as much as possible in order to:
            1. Make your code more readable
            2. Create less trap variables that can lead to undesired behaviors.
]]

local t = 3
t = t + 2 -- Here t is referenced and a global reference is not created.

local function f() end
local f2
f2 = function() end
local f3 = function() end --[[
  This section from lua-users.org:
  """
  the difference between the last two examples is important: the local variable still doesn't exist to the right of the = that gives it the initial value. So if the contents of the function used f to get a reference to itself, it will correctly get the local variable in the first and second versions, but the third version will get the global f (which will be nil, if not a completely unrelated value set by some other code).
  """
]]

--[[
  Closures are the effect that functions (local or not) can use locale variables outside; these functions
  are therefore referred to as "closures"
      -The function sees any changes to the variable outside
]]


--------------------------------------
--[[SECTION CONTROLS & CONDITIONS ]]--
--------------------------------------
--[[
  For any boolean expression Lua treats:

    nil, false    -> FALSE
    Anything else -> TRUE

    Statements like variable assignment are not treated as valid boolean expressions
]]
myBool = true
myVar = 3

if myBool then -- Note for boolean expressions, we don't have to do "myBool == true", you can, but is less concise
  print("I AM HUNGRY")
end --[[
  The most basic conditional statement is the "if" which follows the following format:

      1| if boolean-condition then -- If condition declaration
      2|   todo                    -- Statement to run on boolean condition for true
      3| end                       -- Marks the end of this case

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

  [!] When used with strings, they are evaluated based on the string's alphabetical ordering
  [!] Type coercion does not work thus a statement like

        1| print("1" == 1)

        ^^^
        Returns false, and thus you have to use tonumber() or tostring()

  [!] When used with objects, they are not equal if:
          1. The types are different
          2. Refer to different objects
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

myLuaElvis = 1+1==2 and "Yes" or "No" --[[
  Implementation of a basic Ternary operation in Lua.

  Lua does not support Ternary or Elvis Operators for one line IF-ELSE
]]


--[[LOOPS]]--

while myBool do print("Hello World") end --[[
  This is a basic LOOP. A while loop uses a boolean condition to make the loop run.

  Only until the expression evaluates to false, does the loop exit.

  They follow this format:

    1| while [bool-expr] do <- Loop declaration
    2|   todo <- Blocks of code to execute
    3| end <- Signifies the end of the loop definition

    ^^^^
    for [bool-expr], you can treat it like any expression you would use in an IF-ELSEIF-ELSE statements.
]]

repeat print("Hello world") until myBool --[[
  Similar to a while-loop except that it runs until the condition after "until" becomes true

  Follows this format:

    1| repeat <- Loop declaration
    2|   todo <- Blocks of code to execute
    3| until [bool-expr] <- Signified the end condition

  [!] This loop is similar to a DO-WHILE loop in other languages in which it is guranteed to run at least once
      and then check the condition after the first iteration.
]]

for i = 1, 10, 1 do print(i) end --[[
  This is a numerical-step for-loop, it follows a similar fashion in many other languages.

  It uses two formats:

        1| for var = start, end, step do
        2|  todo <- Code to execute
        3| end    <- Loop End Declaration

        ^^^
        Start -> the start counter
        End   -> the end value to reach (if "var" is greater than end, the loop exits)
        Step  -> How much to increment per iteration. This can also be negative, but will mean that the loop
                will end only if "var" is less than "End"

        1| for var = start, end do
        2|   todo <- Code to execute
        3| end    <- Loop End Declaration

        ^^^
        This modification assumes "step" to be "+1"


    In some languages like Java, C/C++, JavaScript, this kind of loop can be represented as:

    ----- Lua -----   |  ----- Other Langs. -----

    1| for i=0,10 do  |  1| for(var i=0;i<=10;i+=1){
    2| end            |  2| }

    [!] Scoping does not allow the variable in a numerical step loop to be used outside of the loop block
]]

myTable = {1,2,3,4}
for key,val in ipairs(myTable) do print(key.." "..val) end --[[
  This is an iterator based loop. Primarily used for looping through a data structure like that of
  a Table/Array.

  They follow this format:

    1| for var1,var2,var3...varN in [itr-expr] do
    2|  todo <- Code to execute
    3| end    <- Loop End Declaration

  [itr-expr] represents a valid iterator function. Most commonly we use the "ipairs()"
    function to retrieve a key and value pair.
]]

--[[
  Control statements for loops are:

    break -> jump out of the innertmost loop
    goto [expr] -> tell the program to go to this point in the program
      - Goto a expression can be marked with "::[expr-name]::"

      Like so:

      1| while true do
      2|  if someVar > 100 then
      3|    goto outside
      4|  end
      5| end
      6| ::outside::

]]
myVarA = 1
while true do
  myVarA = myVarA + 1
  if myVarA > 5 then break end
end -- BREAK PATTERN DEMONSTRATION

---------------------------
--[[ SECTION FUNCTIONS ]]--
---------------------------
function fun()
  print("Function!")
end --[[
  Functions declare snippets of code that can be called and reused later.

  Functions follow the format of:

      1| function functionName(args) <- The function start
      2|  todo <- Stuffs to execute
      3| end <- The end of the function declaration (similar to a conditional block) ends with "end"

      ^^^^^
      The function start also contains "args" which can be left blank or provided with a
      required argument to take. This is called function input/argument.

  Within the stuffs to execute section, you can write code like any other part of the program we talked
  about before. However, if you use parameters (described below), those are treated as a variable
]]

function add(a, b)
  return a + b
end
print(add(1, 2)) --[[
  Functions can take input via adding variable names in between the parentheses.

  This now means add() requires two arguments in order to work

  The "return" statement is straightforward, it represents a possible result
  the function wants to return. However we cannot specify anything else after
  this "return" statement
      -If no "return" statement is found, the function will not return a resultant:
          function m(a,b) c = a+b end
          print(m(1,2)) -> Nothing or ""
      -This is similar in many other languages: Kotlin/Java, C/C++, JavaScript/TypeScript
      -The resultant should be treated as a "raw" value
      -The only exception to no other statements after "return" is for conditional blocks:
]]
function conditionalReturns(a,b)
  if a + b > 10 then return a + b - 10
  elseif  a + b == 10 then return a + b + 10
  end
  return a+b
end --[[
  Conditional returns can have their return statements wrapped up.

  Note the ending "return a+b". This is the "else" case. You can write
  an "else" case withint he conditional block, but it is not necessary,
  since if all otehr cases fail, the program will jump out and use the
  last return.
]]

fun() --[[
  Similar to calling print() and type()
  calling any other function is as simple as:

      functionName(args?)

      args? -> If argument required
]]

myFunction = function(a,b) return a * b end
print(myFunction(a,b)) -- We can also declare functions to variables and call them like this

--[[
  Builtin functions are functions that come prebundled with Lua.
  Previously the "type()" and "print()" are builtin functions.
  But there are more.

  "tonumber","tointeger" etc are also builtin

  You can find them by starting with "math.", "string."

  There are a lot, so we will not mention all of them.
  Check them out here:
  http://lua-users.org/wiki/TutorialDirectory

  Examples:
]]
string.len("Hello World") -- Gets the length of a provided string
string.upper("yooooo")    -- Makes all characters in a string to uppercase (abc -> ABC)
string.lower("yoink")     -- Makes all characters in a string to lowercase (ABC -> abc)
math.min(2, 30000)        -- Returns the smallest of the two
math.max(2, 30000)        -- Returns the largest of the two
math.random(0, 100)       -- Returns a pseudorandom number from [start, end) where "end" is excluded and "start" is included


-----------------------------------------------
--[[ SECTION METAPROGRAMMING & METAMETHODS ]]--
-----------------------------------------------
--[[
  Metamethods in Lua enables the programmer to overload certain functionalities in Lua objects.
      -Similar to the concept of operator overloading in a language like C++

  Metables is a regular Table data structure that holds metamethods that can be called when specific
  events in Lua are called. Like for example addition ("+" -> __add)

  To make a metatable work, we can use the following examplar:
]]
local myObj = { attribute = ":)" }
local myMetaTable = {
  __add = function(lhs, rhs) -- here lhs -> LeftHandSide & rhs -> RightHandSide
      return { value = lhs.attribute .. rhs.attribtue } -- the desired operation for when the "+" or addition operation is performed on
                                                        -- two objects of myObj
  end
}
setmetatable(myObj, myMetaTable) -- tell Lua we have a new metamethod we want to add
--[[
  Thus we can now do things like

      1| local myObjFinal = myObj + myObj
      2| print(myObjFinal)

]]

--[[
  You can find a list of most overloadable metamethods that you can use here:
  http://www.lua.org/manual/5.4/manual.html#2.4
]]


-------------------------
--[[ SECTION MODULES ]]--
-------------------------
--[[
  [!] THIS IS TARGETTED FOR 5.2 AND ABOVE

  Modules is the most basic way for Lua code to be bundled and used together.

  You declare in the following fashion:

 -- BEGIN: file testModule.lua --

  1| local testModule = {} -- Note you don't specifically have to name the module the same as the file name
  2| function testModule.someFun() print("This is a test") end
  3| return testModule

-- END: file testModule.lua
  To use this module in some other file, we use
  the "require" keyword:
-- BEGIN: file testMyModule.lua --

  1| tM = require 'testModule'
  2| tM.someFun() -- prints "This is a test"

Modules are cached in the global table "package.loaded".
    -this also provides us the ability to reload:

      1| package.loaded.someModule = nil
      2| m = require 'someModule'

You can think of this as a JavaScript Module.exports:

    1| const pkgCode = require("myCodeHere")

Or you can think of it as a C++ Namespace, Java Import/Class/Module

You can also selectively expose modules contents:

1) Declare certain functions as local
2) This format:

      1| local function f1() ... end
      2| local function f2() ... end
      3| return { f1 = f1, f2 = f2 }

3) Combine 1 & 2:

      1| local me = {}
      2| local function f1() ... end
      3| local function f2() ... end
      4| me.f1 = f1
      5| me.f2 = f2
      6| return me

There are some other ways: http://lua-users.org/wiki/ModulesTutorial (using Environment Variables)
]]


------------------------------------
--[[ SECTION OBJECT ORIENTATION ]]--
------------------------------------
--[[
  Even though Lua is not OOP and there are no Class constructs, we can imitate using metatables.

  We can achieve this by creating a table that represents a "class" and have metatable attributes like
  "__index" and then we can use modular functions to create instance methods

  We often use the "self" semi-keyword to refer to the current instance.

  When we create a function with the first argument as "self" Lua automatically has a feature where if you want
  access a member method within the instance, you can use the ":" operator to work on this instance without
  having to call:

      1| myInstance.func(myInstance, args)

  Instead you can just do:

      2| myInstance:func(args)

  For example:
]]

local ExampleClass = {}
ExampleClass.__index = ExampleClass -- if default lookup fails we daful to table lookups for method names
function ExampleClass.new(init) -- a function equivalent to a constructor
  local self = setmetatable({}, ExampleClass)
  self.value = init
  return self
end
function ExampleClass.set_val(self, val)
  self.value = val
end
--Usage--
local exampleClass_E = ExampleClass.new(5)
exampleClass_E:set_val(1) -- value is now 1
--[[
  This seems quite similar to how some other languages do their OOP-ish
  modularity, like JavaScript, Python, etc..
]]

