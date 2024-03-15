import UIKit

// 1. while ციკლის გამოყენებით, 1-დან 20-მდე დაბეჭდეთ ყველა კენტი რიცხვის ნამრავლი.

var index = 1
var product = 1
while index < 20 {
    if index % 2 == 1 {
        product = product * index
    }
    index += 1
}

print("1 - დან 20 - მდე კენტი რიცხვების ნამრავლია : \(product)")


// 2.შექმენით String ტიპის ცვლადი და ციკლის გამოყენებით შემოაბრუნეთ ის, მაგ: თუ გვაქვს “Test” უნდა მივიღოთ “tseT”

var secondProblem: String = "Test"
var reverse: String = ""
for i in secondProblem {
    reverse = "\(i)" + reverse
}

print(reverse)

// 3. while loop-ისა და switch statement-ის გამოყენებით შექმენით უსასრულო შუქნიშანი, რომელიც ბეჭდავს შემდეგნაირად. "🔴->🌕->🟢->🔴->🌕..."

var currentColor = "🌕"
var timesToRepeat = 20
var timesRepeated = 0
switch currentColor {
case "🔴":
    while timesRepeated < timesToRepeat {
        print("🔴->🌕->🟢->", terminator: "")
        timesRepeated += 1
    }
case "🌕":
    while timesRepeated < timesToRepeat {
        print("🌕->🟢->🔴->", terminator: "")
        timesRepeated += 1
    }
case "🟢":
    while timesRepeated < timesToRepeat {
        print("🟢->🔴->🌕->", terminator: "")
        timesRepeated += 1
    }
default:
    break
}
print("\n")



// 4. Rammstein-ის კონცერტის ბილეთები იყიდება, თუმცა რაოდენობა ძალიან შეზღუდულია. While loop-ის მეშვეობით შექმენით ბილეთების გაყიდვის სიმულაცია და ყოველ გაყიდულ ბილეთზე დაბეჭდეთ “ბილეთი გაყიდულია, დარჩენილია მხოლოდ X რაოდენობა”, მანამ სანამ ბილეთების რაოდენობა მიაღწევს 0-ს, რის შემდეგაც ბეჭდავთ - “ყველა ბილეთი გაყიდულია გელოდებით კონცერტზე”

var x = 20
while x > 0 {
    print("ბილეთი გაყიდულია, დარჩენილია მხოლოდ \(x) რაოდენობა")
    x -= 1
    if x == 0 {
        print("ყველა ბილეთი გაყიდულია, გელოდებით კონცერტზე")
    }
}


// 5.შექმენით array, შეავსეთ ისინი ელემენტებით. შეამოწმეთ და დაბეჭდეთ: "array-ში ყველა ელემენტი განსხვავებულია" ან "array შეიცავს მსგავს ელემენტებს"  (array-ს ტიპს არაქვს მნიშვნელობა.)

let arrayToCheck = [2, 3, 6, 10, 20, 19, 3]
var counter = 0
for i in 0 ..< arrayToCheck.count {
    for j in i + 1 ..< arrayToCheck.count {
        if arrayToCheck[i] == arrayToCheck[j] {
            counter += 1
        }
    }
}

print(counter != 0 ? "array შეიცავს მსგავს ელემენტებს" : "array-ში ყველა ელემენტი განსხვავებულია")


// 6.დაწერეთ ქლოჟერი რომელიც გამოითვლის ორი რიცხვის სხვაობას და დააბრუნებს მიღებულ მნიშვნელობას

let fNum = 6
let sNum = 10
var sixth: (Int, Int) -> Int = { fNum, sNum in
    return fNum - sNum
}

print(sixth(fNum, sNum))



// 7. დაწერეთ ფუნქცია, რომელსაც გადააწვდით String ტიპის პარამეტრს. დაითვალეთ ამ პარამეტრში თანხმოვნების რაოდენობა და დაბეჭდეთ ის.

let stringToCheck = "Mein herz in flammen"
let vowels: [Character] = ["a", "e", "i", "o", "u", " "]
var consonantCount = 0
for i in stringToCheck {
    if !vowels.contains(i.lowercased()) {
        consonantCount += 1
//        continue
    }
}

print("წინადადებაში \(stringToCheck) თანხმოვნების რიცხვია : \(consonantCount)")


// OPTIONALS
// 1. შექმენით ორი Int-ების array, შეავსეთ პირველი array 8, 4, 9, 9, 0, 2, და მეორე array 1, 0, 9, 2, 3, 7, 0, 1 ამ რიცხვებით. გააერთიანეთ ეს ორი array ერთ დასორტილ array-ში, ანუ შედეგი უნდა მიიღოთ ასეთი: 0, 0, 0, 1, 1, 2, 2, 3, 4, 7, 8, 9, 9, არ გამოიყენოთ sorted() ან რაიმე სხვა უკვე არსებული მეთოდი swift-იდან. დაბეჭდეთ მიღებული დასორტილი array.

// ზედმეტი თავის ტკივილი რომ ავირიდო, ამ ორ ერეის გავაერთიანებ და მივუდგები, როგორც ერთს.

var arrayOne = [8, 4, 9, 9, 0, 2]
var arrayTwo = [1, 0, 9, 2, 3, 7, 0, 1]
for i in arrayTwo {
    arrayOne.append(i)
}

// var arrayOne = [8, 4, 9, 9, 0, 2, 1, 0, 9, 2, 3, 7, 0, 1]

for i in 0 ..< arrayOne.count {
    for j in 0 ..< arrayOne.count {
        var temp = 0
        if arrayOne[i] < arrayOne[j] {
            temp = arrayOne[i]
            arrayOne[i] = arrayOne[j]
            arrayOne[j] = temp
        }
    }
}

print(arrayOne)


// 2. დაწერეთ ფუნქცია, რომელსაც გადააწვდით int ტიპის პარამეტრს. გამოითვალეთ ამ პარამეტრის ფაქტორიალი და დაბეჭდეთ

func factorial(num: Int) -> Int {
    var result = 1
    for i in 1 ..< num + 1 {
        result *= i
    }
    return result
}

var finalResult = factorial(num: 5)

print("შეყვანილი რიცხვის ფაქტორიალია \(finalResult)")


// 3. შექმენით Int-ების array, შეავსეთ ის 0-იდან 10-ის ჩათვლით რიცხვებით. loop-ის  გამოყენებით დაშალეთ ეს array 2 array-იდ. ერთში გადაიტანეთ კენტი რიცხვები, მეორეში კი ლუწი რიცხვები, დაბეჭდეთ ორივე მიღებული array.

var mainArray: [Int] = []
for i in 1 ... 10 {
    mainArray.append(i)
}

var arrayOfEvens: [Int] = []
var arrayOfOdds: [Int] = []

for i in mainArray {
    if i % 2 == 0 {
        arrayOfEvens.append(i)
    } else {
        arrayOfOdds.append(i)
    }
}

print("კენტი რიცხვების array : \(arrayOfOdds) \nლუწი რიცხვების array: \(arrayOfEvens)")
