import UIKit

// 1.დაწერეთ ფუნქცია რომელიც პარამეტრად მიიღებს String-ს და დააბრუნებს ბულიანს. ფუნქციამ უნდა შეამოწმოს მიღებული სტრინგი სარკისებურია თუ არა (სიტყვა ან წინადადება რომელიც იკითხება ერთნაირად როგორც თავიდან, ისე ბოლოდან მაგ: “ანა”, “აირევი ივერია”, “მადამ”)

func isSarkisebri(inputString: String) -> Bool {
    var mirrored: String = ""
    for i in inputString {
        mirrored = "\(i)" + mirrored
    }
    if inputString.replacingOccurrences(of: " ", with: "") ==
        mirrored.replacingOccurrences(of: " ", with: "") {
        return true
    } else { return false }
}

let string1 = "აი რა მზის სიზმარია"
let string2 = "აი დროშა აშორდია"
let string3 = "მესამე აღარ ვიცი"

print("\(string1) -> \(isSarkisebri(inputString: string1))")
print("\(string2) -> \(isSarkisebri(inputString: string2))")
print("\(string3) -> \(isSarkisebri(inputString: string3))")

print("\n")

// 2.დაწერეთ ფუნქცია რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.

func square(arrOfNumbers: [Int]) -> [Int] {
    var newArray: [Int] = []
    for number in arrOfNumbers {
        newArray.append(number * number)
    }
    print("\(arrOfNumbers)  ->  \(newArray)")
    return newArray
}

var arr1 = [3, 5, 1, 10]
square(arrOfNumbers: arr1)

print("\n")
// 3. დაწერეთ Closure რომელიც გაფილტრავს ლუწ რიცხვებს Int-ების Array-დან.
let filterEvens: ([Int]) -> [Int] = { numbers in
    var evens: [Int] = []
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        }
    }
    return evens
}

let thirdArray = [3, 1, 6, 10, 411, 14]
print("\(thirdArray) მასივისგან მიღებული ლუწი რიცხვების მასივია : \(filterEvens(thirdArray))\n")

// 4. დაწერეთ ფუნქცია, რომელიც პარამეტრად იღებს Int-ების მასივს. Escaping closure-ის მეშვეობით დაბეჭდეთ მიწოდებული მასივის ჯამი 5 წამის შემდეგ. დარწმუნდით რომ closure არის escaping და გამოიძახეთ ის მას შემდეგ რაც ფუნქცია დაბრუნდება.

func delayed(arrayOfInts: [Int]) {
}

let arrayFourth = [201, 9, 8, 16, 26]
print(delayed(arrayOfInts: arrayFourth))

// 5.შექმენით  კონტაქტების Dict სადაც key არის სახელი და value ტელეფონის ნომერი, დაამატეთ, დაბეჭდეთ/მოძებნეთ და წაშალეთ კონტაქტი

var contacts: [String: Int] = [
    "Luka": 599076384,
    "shavikata": 123123,
    "tetrikata": 321321,
]

// კონტაქტის დამატება
contacts.updateValue(9999999, forKey: "chrelikata")


// ფუნქცია, რომელსაც გამოაქვს სახელები და ტელეფონის ნომრები, ყოველ ჯერზე ციკლი რო არ ვწერო
func fetchNumbers(dict: [String: Int]) {
    for (key, value) in dict {
        print("\(key)'s number is \(value)")
    }
    print("\n")
}

fetchNumbers(dict: contacts)

// კონტაქტის წაშლა
contacts.removeValue(forKey: "Luka")

fetchNumbers(dict: contacts)

// 6.დაწერეთ ფუნქცია რომელიც პარამეტრად იღებს [String: Int] ტიპის Dictionary-ს და დააბრუნებს ანბანურად დალაგებულ dictionary-ს key ელემენტების მასივს.

func sortKeys(dictToSort: [String: Int]) -> [String] {
    var sortedKeys: [String] = []
    for (key, _) in dictToSort {
        sortedKeys.append(key)
    }
    return (sortedKeys.sorted())
}

print("ანბანურად დალაგებული dictionary-ს key ელემენტების მასივი ->  \(sortKeys(dictToSort: contacts)) \n")


// 7. შექმენით Double-ების მასივი, შეავსეთ ის თქვენთვის სასურველი რიცხვებით.  loop-ის გამოყენებით იპოვეთ ყველაზე დიდი რიცხვი ამ მასივში და დაბეჭდეთ.
let arrayOfDoubles: [Double] = [20.19, 8.9, 3.17]
var greatest: Double = arrayOfDoubles[0]
for i in arrayOfDoubles {
    if i > greatest {
        greatest = i
    }
}

print("მასივში \(arrayOfDoubles) ყველაზე დიდი რიცხვია \(greatest) \n")


let lelaWhatMovementIsThis: [String: Int] = [
    "ღამის სიჩუმე გაფანტე": 235,
    "ვიხსენებ ყველაფერს თავიდან": 219,
    "სულელი წვიმა": 231,
    "ალალ მე": 231,
    "იდუმალი ღამე": 221,
    "ჩუმად ნათქვამი": 199,
    "თეთრი ქარავანი": 221,
    "ძველი ვერხვები": 193,
]

// 1. დაწერეთ ფუნქცია რომელიც გამოითვლის და დაბეჭდავს სიღერების ჯამურ ხანგრძლივობას წუთებში და წამებში

func CountTotalLength(songList: [String: Int]) {
    var totalLength = 0
    for (_, length) in songList {
        totalLength += length
    }
    var totalLengthInMins = floor((Double(totalLength) / 60) * 100) / 100
    print("სიმღერების ჯამური ხანგრძლივობაა \(totalLength) წამი, that is \(totalLengthInMins) წუთი\n")
}

CountTotalLength(songList: lelaWhatMovementIsThis)


// 2.დაწერეთ ფუნქცია რომელიც იპოვის და დაბეჭდავს ყველაზე ხანგრძლივი და ხანმოკლე სიმღერის სახელს.

func longestAndShortest(songList: [String: Int]) {
//    var longest: [String: Int]
    var shortestSong: [String: Int] = ["": 0]
    var longestSong: [String: Int] = ["": 0]
    var shortest = Int.max // კარგი იქნებოდა სხვა ვარიანტი გამომენახა, მაგალითად პირველი ელემენტისთვის მიმენიჭებინა მინიმალური, მაგრამ ვინაიდან ეს ერეი არაა და ცოტა უფრო მეტი წერა მომინდებოდა, ამოხსნის მომენტში ყველაზე მოკლე სოლუშენად ეს მოვიფიქრე.
    var longest = 0
    for (name, length) in songList {
        if length < shortest {
            shortest = length
            shortestSong = [name: length]
        }
        if length > longest {
            longest = length
            longestSong = [name: length]
        }
    }
    for (name, length) in shortestSong {
        print("ყველაზე ხანმოკლე სიმღერაა : \(name). მისი ხანგრძლივობაა \(length) წამი")
    }
    for (name, length) in longestSong {
        print("ყველაზე გრძელი სიმღერაა : \(name). მისი ხანგრძლივობაა \(length) წამი")
    }
}

longestAndShortest(songList: lelaWhatMovementIsThis)

print("\n")
// 3. დაწერეთ ფუნქცია რომელიც გამოითვლის სიმღერების საშუალო ხანგრძლივობას

func averageSongDuration(songList: [String: Int]) -> Int {
    var averageduration = 0
    var counter = 0
    for (_, length) in songList {
        averageduration += length
        counter += 1
    }
    return averageduration / counter
}

print("სიმღერების საშუალო ხანგრძლივობაა : \(averageSongDuration(songList: lelaWhatMovementIsThis)) წამი \n")


// 4.დაწერეთ ფუნქცია რომელიც შემთხვევითად ამოარჩევს სიმღერას და დაბეჭდავს მის სახელს
func randomSongPicker(songList: [String: Int]) {
    var arrayOfSongNames: [String] = []
    for (name, _) in songList {
        arrayOfSongNames.append(name)
    }
    var randomNumber = Int.random(in: 0 ..< arrayOfSongNames.count)
    print("შემთხვევით არჩეული სიმღერაა : \(arrayOfSongNames[randomNumber])")
}

randomSongPicker(songList: lelaWhatMovementIsThis)

