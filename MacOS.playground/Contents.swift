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

// Removing arrays
array1.remove(at: 2)

// Changing more than 1 array elements
array1[0...2] = [1,2,3]

// Accessing Arrays
print("Index 0 : \(array1[0])")

// Getting length of an array
print("Length : \(array1.count)")
print(array1)

// Fill array with repeating values
var array2 = Array(repeating: 15, count: 5)

// Combining arrays
var array3 = array1+array2

// Get Index and value of arrays
for (index,value) in array3.enumerated(){
    print("Index is \(index) and value is \(value)")
}

// Array Contains
print("3? : \(array3.contains(3))")

// Get minimum and maximum values in array
print("Min : \(array3.min()!)")
print("Max : \(array3.max()!)")

// Sort Array
array3.sort()
array3.sort{$0 > $1}

// Multi dimensional arrays and accessing them
var array4 = [[1,2,3],[4,5,6],[7,8,9]]
print("Array : \(array4[1][0])")

// Apart from this we can apply functions such as map
// and filter to filter or combine our array

/* Note-: Optional or ! is the object that has the option of
 either containing no value" */


// Dictionaries are unordered list of key value pairs
var dict1 = [Int : String]()
dict1[0] = "Hitesh Chopra"
var cust :[String:String] = ["1":"John","2":"Charles","3":"Parry"]
cust["2"]="Cormen"

for (key,value) in cust{
    print("\(key) : \(value)")
}


// Strings always contains text and escape characters
var str1 = "A String\n"

// Multiline Strings
var str2 = """
This is au
multiline String
in Swift Language
aeio
"""
print(str2)

// Combine string
var combineString = str1 + str2 + "Hello world"
print(combineString)

// Fetch first character of a string
print("First is \(str1[str1.startIndex])")

// Fetch nth character of a string
print("Fifth is \(str1[str1.index(str1.startIndex, offsetBy: 3)])")

// Check if any character is there inside a string
print("A in string : \(str1.contains("A"))")

//Check for vowels/multiple characters in String
print("Vowels : \(str2.contains{"aeiou".contains($0)})")

// Get first 3 character of the string
print("1st 3 charcters are-: \(String(str2.prefix(3)))")

// Split everywhere there is a space
let splitArray = str2.split{$0 == "\n"}
print(splitArray[0])

// Tuples can contain multiple values of different data types
var tuple1 :(String,Int) = ("Age",45)
var s1:String
var s2:Int
(s1,s2) = tuple1
print("\(tuple1.0) \(tuple1.1) \(s1) \(s2)")

// Assign labels to elements
var t3 : (city:String,state:String) = ("Chandigarh","Punjab")
print("City is \(t3.city) and state is \(t3.state)")

// Sets are unordered lists of unique items
var nums = Set<Int>()
nums.insert(1)
var nums2 : Set<Int> = [1,2,3]

// Remove a value
nums2.remove(0)

// Check if present or not
print("3 ? \(nums2.contains(3))")

// Filters
let fnum = [1,2,3,4,5,6]

// Filter everything which has an even value
let evenFnums = fnum.filter{
    (num:Int) in
    return num%2==0
}

print(evenFnums)

// Enums are used when we want to define types with limited number of cases
enum Emotion{
    case joy
    case anger
    case fear
    case disgust
}

var feeling = Emotion.joy
print(feeling)
feeling = .anger
print(feeling)

/* Options is a type that can either have or not have a value
 Variables in general cannot contain a nil value. In situations when
 we cannot gaurantee that we have a value , we can use optionals. The
 optional will have a value of nil up until the value is assigned.*/

var oName:String? = "Hitesh"
var oAge:Int? = nil
oAge = 45
if(oName != nil && oAge != nil){
    let uName:String = oName!
    let uAge:Int = oAge!
    print("Hello \(uName) \(uAge)")
}


// Exception handling
enum DivisionError : Error{
    case DivideByZero
}


func divide(num1:Float,num2:Float)throws -> Float{
    guard num2 != 0.0 else {
        throw DivisionError.DivideByZero
    }
    return num1/num2
}

do {
    try divide(num1: 10, num2: 0)
} catch DivisionError.DivideByZero{
    print("Not possible to divide by zero mate")
}


// Structs

struct Rectangle {
    var height = 0.0
    var length = 0.0
    func area() -> Double {
        let area = height * length
        return area
    }
}

let myRect = Rectangle(height:10.0,length:5.0)
print("Area : \(myRect.height) * \(myRect.length) = \(myRect.area())")

/* Classes-: The difference between classes and structs in swift is that classes can
 inherit or extend other classes unlike structs */

class Warrior {
    var name:String = "Warrior"
    var health:Int = 100
    var attackMax:Int = 10
    var blockMax:Int = 10
    
    init(_ name:String,_ health:Int, _ attackMax:Int, _ blockMax:Int){
        // Use self to refer to the object's name
        self.name = name
        self.health = health
        self.attackMax = attackMax
        self.blockMax = blockMax
    }
    
    func attack() -> Int{
        return Int.random(in: 1...self.attackMax)
    }
    
    func block() -> Int{
        return Int.random(in: 1...self.blockMax)
    }
}

class Battle {
    func startFight(_ warrior1 :Warrior, _ warrior2 :Warrior){
        while true {
            if(Battle.getAttackResolved(warrior1, warrior2)=="Game Over"){
                print("Game Over")
                break;
            }
            if(Battle.getAttackResolved(warrior2, warrior1)=="Game Over"){
                print("Game Over")
                break;
            }
        }
    }
    
    static func getAttackResolved(_ warriorA :Warrior, _ warriorB:Warrior)->String{
        let warriorAAtackAmt:Int = warriorA.attack()
        let warriorBBlockAmt:Int = warriorB.block()
        var damage2WB:Int = warriorAAtackAmt-warriorBBlockAmt
        damage2WB = damage2WB <= 0 ? 0 :damage2WB
        warriorB.health = warriorB.health - damage2WB
        print("\(warriorA.name) attacks \(warriorB.name) and deals \(damage2WB) damage")
        print("\(warriorB.name) is down to \(warriorA.health)")
        if(warriorB.health<=0){
            print("\(warriorB.name) has Died and \(warriorA.name) is Victorious")
            return "Game Over"
        }else{
            return "Fight Again"
        }
    }
}

/* Inheritance
 Protocols are like interfaces in other classes and th way they work
 is when a class adopts a protocol, it agrees to define any behaviour
 that is defined inside of our protocol */

protocol Teleports{
    func teleport() ->String
}

class CanTeleport : Teleports {
    func teleport() -> String {
        return "Teleports Away"
    }
}

class CantTeleport:Teleports{
    func teleport() -> String {
        return "Failed to teleport"
    }
}

class MagicWarrior:Warrior{
    var teleportChance :Int  = 0
    var teleportType = CantTeleport()
    init(_ name:String,_ health:Int, _ attackMax:Int, _ blockMax:Int, _ teleportChance:Int){
        super.init(name, health, attackMax, blockMax)
        self.teleportChance = teleportChance
    }
    override func block() ->Int{
        let rndDodge = Int.random(in: 1...100)
        if rndDodge<self.teleportChance{
            print(self.name + " " + teleportType.teleport())
            return 10000
        } else{
            return super.block()
        }
    }
}
let thor = Warrior("Thor",80,26,10)
let loki = MagicWarrior("Loki",50,20,10,50)
let battle = Battle()
battle.startFight(thor, loki)

/* Extensions are used to add functionalities to existing classes, enums, protocols
 but they cannot be used to override existing functions */

extension Double{
    var km: Double { return self }
    var m: Double { return self * 1000.0 }
    var cm: Double { return self * 100.0 }
}

let km = 4.3
let m = km.m
print("\(km) km =  \(m) meters")

/* Generics is the placeholder type in which data type will be assigned later based
   on what type of data type we are working with */
protocol Summable {
    static func +(x:Self,y:Self) -> Self
}

extension Int:Summable{}
extension Double:Summable{}
extension String :Summable{}

// T here is the generic parameter
func sum<T:Summable>(_ x:T, _ y:T) -> T{
    return x + y
}

print("10 + 20 = \(sum(10, 20))")
print("4.6 + 5.4 = \(sum(4.6, 5.4))")
print("Hitesh + Chopra = \(sum("Hitesh","Chopra"))")
