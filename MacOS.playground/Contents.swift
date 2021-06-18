import Cocoa

// Data types
// var can be reassigned
var greeting = "Hello, playground"

// let is used to define a constant immutable variable
let name = "Hitesh"

// Define type of data types
var age:Int  = 22
var isAdult : Bool = true
var startingChar : Character = "H"
var decimal : Float = 4.56

// Apart from this we have different data types like Int8, Int16, Int32 etc
// Type Casting
print("Float to Int Conversion is \(Int(decimal))")

// Print
print("Name is \(name) and age is \(age)")

// Switch Case
let testScore :Int = 50
switch testScore {
case 93...100:
    print("Excellent")
case 70...92:
    print("Very good")
default:
    print("Try harder")
}

// Looping
var a = [1,2,3,4]
for item in a{
    print(item)
}

// Conditional looping
for i in 1...10 where i%2==0 {
    print(i)
}

// Stride
for i in stride(from: 100,through: 0, by: -5 ){
    print("Stride \(i)")
}

// Foreach
a.forEach{ print($0) }

// While loop
var i = 50
while(i>20){
    print("While \(i)")
    i=i-1
}

// Repeat while(similar to do while)
repeat{
    print("Repeat while \(i)")
    i-=1
} while (i != 0)

// Iterator
var data = (1...10).makeIterator()
while let d = data.next(){
    print(d)
}

// Functions (with named parameters)
func add(x:Int,y:Int)-> Int{
    return x+y
}

// Functions (without named parameters)
func sub(_ x:Int,_ y:Int)-> Int{
    return abs(x-y)
}

// Function Overloading
func add(x:Int,y:Int,z:Int)->Int{
    return x + y + z
}

//Functions that don't return anything set return type to void
func greet() -> Void{
    print("Greetings from Hitesh")
}

print("Sum of 4 and 6 is \(add(x:4, y:6))")
print("Sum of 4, 6 and 10 is \(add(x:4, y:6, z:10))")
print("Differnce between 10 and 4 is \(sub(10, 4))")
greet()


/* Note-: We cannot change the parameter value
 inside the function directly as the values passed
 inside the function parameters areof the type let by default
 which means that they are constant. We can either replace it
 or use inout(which means passing the local variable will also
 reflect changes outside the function) */

/* For passing an inout integer while calling the function,
 use the & along with the value */

var number:Int = 50
func changeMe(_ n:inout Int)->Void{
    n = n + 30
}
changeMe(&number)
print(number)


// Return more than 2 values from a function
func twoMultiply(num:Int)->(two:Int,three:Int){
    let two :Int = num*2
    let three :Int = num*3
    return (two,three)
}

let mults = twoMultiply(num: 2)
print(mults.two)

// Function with variadic parameters
func getSum(_ intArr: Int...)->Int{
    var sum: Int = 0
    intArr.forEach {
        sum+=$0
    }
    return sum
}

print("Sum = \(getSum(400,500,600,700,800))")

// Recursion
func factorial(_ num:Int)->Int{
    var result:Int=0
    if(num==1){
        return 1
    }else{
        result = num*factorial(num-1)
        return result
    }
}

print(factorial(4))

// Assign function to a variable and use it as function
func multiplyThree(_ num:Int)->Int{
    return num*3
}
var intoThree = multiplyThree
print(intoThree(20))

// Passing function to another function

// Pass a function into the runFunc() function which returns nothing
func acceptFunction(_ passed:()->()){
    passed()
}

func displayName() -> Void{
    print("Dr. Strange")
}

acceptFunction(displayName)

// Pass a function into the doMath() function which accepts 2 integers
// and returns a single integer

func doMath(_ multiply:(Int,Int)->(Int),_ a:Int, _ b:Int)->Int{
    return multiply(a,b)
}

func multiply(_ a:Int, _ b:Int)->Int{
    return a*b
}

print(doMath(multiply, 10, 20))

// Return a function from a function
func makeFunction(_ a:Int)->(Int)->Int{
    func addValues(b:Int) ->Int{
        return a+b
    }
    return addValues
}

let addTwo = makeFunction(50)
print(addTwo(30))

/* Closures are the functions which does not require a name or a function defination */

var cube:(Int,Int,Int) ->(String) = {
    a,b,c in
    return "Hitesh \(a*b*c)"
}
print(cube(5,6,7))

// Refer values outside of the closure
let numbers = [1,24,5,34,3,8]
let sortedNumbers = numbers.sorted(by: {x,y in x>y})

sortedNumbers.forEach{
    print($0)
}

// Mapping
let squaredNumbers = numbers.map{
    (num:Int) -> String in "\(num*num)"
}
print(squaredNumbers)

// Ranges
let r1 = 1...3
for i in r1{
    print(i)
}

let r2 = 1..<3

for i in r2 {
    print(i)
}

for i in (5...10).reversed() {
    print("Name: \(i)")
}

// Arrays
var array1 = [Int]()
print("Empty \(array1.isEmpty)")
array1.append(50)
array1+=[5,30]
print(array1)

// Inserting array at a specific position
array1.insert(30, at: 2)

// Accessing Arrays
print("Index 0 : \(array1[0])")

// Getting length of an array
print("Length : \(array1.count)")
print(array1)
