import UIKit

// 1)  დაწერეთ ფუნქცია რომელიც იღებს 2 პარამეტრს(სტრინგებს), და აბრუნებს Boolean ს თუ ეს ორი სტრინგი შედგება ერთიდაიგივე ასოებისგან, რიგითობას მნიშვნელობა არ აქვს.
// დიდ და პატარა ასოებსაც ვითვალისწინებთ.
//
// მაგ:
// "abc" და "bca" დააბრუნებს true
// "Abc" და "abc" აბრუნებს false. A და a სხვადასხვად ითვლება!

func stringsToCheck(string1: String, string2: String) -> Bool {
    var arr1: [Character] = []
    var arr2: [Character] = []
    for i in string1 {
        arr1.append(i)
    }
    for j in string2 {
        arr2.append(j)
    }
    print("\(string1)  =  \(string2)  ->  ", terminator: "")
    return arr1.sorted() == arr2.sorted() ? true : false
}


var par1 = "abc"
var par2 = "bac"
print(stringsToCheck(string1: par1, string2: par2))

var par3 = "Abc"
var par4 = "abc"
print(stringsToCheck(string1: par3, string2: par4))


print("\n")
// 2) დაწერეთ ფუნქცია რომელიც მიიღებს და დააბრუნებს სტრინგს სადაც ზედმეტ სფეისებს მოაშორებს.
//
// მაგ:
// "a[space][space][space]b[space]b[space][space][space]c" დააბრუნებს "a[space]b[space]c"
// "[space][space][space]a" დააბრუნებს "[space]a" ანუ 1 სფეისი ყოველთვის რჩება, ამ შემთხვევაში წინაც.

func oddSpaces(removeFrom: String) -> String {
    var newString = ""
    var spaces = 0
    for i in removeFrom {
        if i == " " && spaces == 0 {
            newString.append(i)
            spaces = 1
        } else if i != " " {
            spaces = 0
            newString.append(i)
        }
    }
    return newString
}

print(oddSpaces(removeFrom: " d a  u k a   r    iiii   t  "))

print("\n")
// 3) დაწერეთ ფუნქცია რომელიც იღებს სტრინგს(ეს სტრინგი მოიცავს ასევე ციფრებს), გაფილტრეთ/მოაშორეთ ასოები და დარჩენილი ციფრების ჯამს აბრუნებთ.
//
// მაგ:
// “a1b2c3” აბრუნებს 6  ანუ(1+2+3)
// “asdf10b20c30” აბრუნებს 60 ს  (10 + 20 + 30) და ა შ.

func filterString(filter: String) -> Int {
    let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var numbers = ""
    var charDetected = 1
    for i in filter {
        if !digits.contains(i) && charDetected == 1 {
            continue
        } else if !digits.contains(i) && charDetected == 0 {
            numbers.append(" ")
            charDetected = 1
        } else if digits.contains(i) {
            numbers.append(String(i))
            charDetected = 0
        }
    }
    var sum = 0
    let numbersAsStrings: [String] = numbers.components(separatedBy: " ")
    for numToSum in numbersAsStrings {
        sum += Int(numToSum) ?? 0 // xCodem tavisit damifixa, stringis Intad gadayvanistvisaa sachiro
    }
    print("\(filter) -> \(numbers.replacingOccurrences(of: " ", with: "+")) = ", terminator: "")
    return sum
}

print(filterString(filter: "df1bb2c30"))
print(filterString(filter: "df10bb20c30"))
print(filterString(filter: "a1b2c3"))
