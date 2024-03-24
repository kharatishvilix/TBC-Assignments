import UIKit

// შევქმნათ Class Book.
// Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
// Designated Init.
// Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
// Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    let bookID = UUID()
    let title: String
    let author: String
    var isBorrowed: Bool

    init(bookID: UUID = UUID(), title: String, author: String, isBorrowed: Bool) {
        self.title = title
        self.author = author
        self.isBorrowed = isBorrowed
    }



    func borrowed() {
        isBorrowed = true
        print("\(title) არაა ხელმისაწვდომი")
    }

    func returned() {
        isBorrowed = false
        print("\(title) ხელმისაწვდომია")
    }
}

// შევქმნათ Class Owner
//
// Properties: ownerId(უნიკალური იდენტიფიკატორი Int), String name, Books Array სახელით borrowedBooks.
// Designated Init.
// Method რომელიც აძლევს უფლებას რომ აიღოს წიგნი ბიბლიოთეკიდან.
// Method რომელიც აძლევს უფლებას რომ დააბრუნოს წაღებული წიგნი.


class Owner {
    var ownerID = UUID()
    var name: String
    var borrowedBooks: [String]

    init(ownerID: UUID = UUID(), name: String, borrowedBooks: [String]) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }

    func borrowABook(bookName: Book) {
        if !bookName.isBorrowed {
            bookName.isBorrowed = true
            borrowedBooks.append(bookName.title)
            print("\n\(name) - მა წაიღო წიგნი : \(bookName.title)")
        } else {
            print("\(bookName.title) უკვე წაღებულია, აირჩიეთ სხვა წიგნი")
        }
    }

    func returnABook(bookName: Book) {
        bookName.isBorrowed = false
        if let bookIndexInArray = borrowedBooks.firstIndex(of: bookName.title) {
            borrowedBooks.remove(at: bookIndexInArray)
            print("\n\(name) - მა დააბრუნა წიგნი : \(bookName.title)")
        } else {
            print("ამ კაცს ეს წიგნი არ აუღია და რას ერჩით")
        }
    }
}

// შევქმნათ Class Library
//
// Properties: Books Array, Owners Array.
// Designated Init.
// Method წიგნის დამატება, რათა ჩვენი ბიბლიოთეკა შევავსოთ წიგნებით.
// Method რომელიც ბიბლიოთეკაში ამატებს Owner-ს.
// Method რომელიც პოულობს და აბრუნებს ყველა ხელმისაწვდომ წიგნს.
// Method რომელიც პოულობს და აბრუნებს ყველა წაღებულ წიგნს.
// Method რომელიც ეძებს Owner-ს თავისი აიდით თუ ეგეთი არსებობს.
// Method რომელიც ეძებს წაღებულ წიგნებს კონკრეტული Owner-ის მიერ.
// Method რომელიც აძლევს უფლებას Owner-ს წააღებინოს წიგნი თუ ის თავისუფალია.

class Library {
    var Books: [Book]
    var Owners: [Owner]

    init(Books: [Book], Owners: [Owner]) {
        self.Books = Books
        self.Owners = Owners
    }


    func addANewBook(bookName: Book) {
        Books.append(bookName)
    }

    func addOwners(ownerName: Owner) {
        Owners.append(ownerName)
    }

    func showAvailableBooks() {
        if Books.count > 0 {
            print("\nბიბლიოთეკაში არსებული თავისუფალი წიგნებია : ")
            for i in Books {
                if !i.isBorrowed {
                    print("\(i.title)")
                }
            }
        } else {
            print("ყველა წიგნი წაღებულია")
        }
    }

    func showBorrowedBooks() {
        if Books.count > 0 {
            print("\nწაღებული წიგნებია : ")
            for i in Books {
                if i.isBorrowed {
                    print("\(i.title)")
                }
            }
        } else {
            print("ყველა წიგნი თავისუფალია")
        }
    }

    func borrowedBy(person: Owner) {
        if person.borrowedBooks.count > 0 {
            print("\(person.name) - ის მიერ წაღებული წიგნებია: ")
            for i in person.borrowedBooks {
                print(i)
            }
            print("\n")
        } else {
            print("\(person.name) - ს არ აქვს წაღებული არც ერთი წიგნი. ")
        }
    }
}


// წიგნის შექმნა
var leavesOfGrass = Book(title: "Leaves Of Grass", author: "Walter White", isBorrowed: false)
var vefkhistkaosani = Book(title: "Vefkhistkaosani", author: "Shota Rustaveli", isBorrowed: false)
var developInSwift = Book(title: "Develop In Swift Explorations", author: "Apple Education", isBorrowed: false)
var howToBell = Book(title: "How to bell", author: "Batoni Vasili", isBorrowed: false)
var davitisShutkebi = Book(title: "Davitis citatebi lekciis msvlelobisas", author: "Daviti", isBorrowed: false)

// owner-ის შექმნა
var kharatishvili = Owner(name: "Luka Kharatishvili", borrowedBooks: [])
var tetriKata = Owner(name: "Macivara", borrowedBooks: [])
var baksi = Owner(name: "Baksi", borrowedBooks: [])

// ბიბლიოთეკის შექმნა და წიგნებისა და owner-ების დამატება
var zahesiLibrary = Library(Books: [leavesOfGrass, vefkhistkaosani, developInSwift, howToBell, davitisShutkebi], Owners: [kharatishvili, tetriKata, baksi])

// ყველა ხელმისაწვდომი წიგნის ნახვა
zahesiLibrary.showAvailableBooks()

// წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
kharatishvili.borrowABook(bookName: leavesOfGrass)
kharatishvili.borrowABook(bookName: developInSwift)
kharatishvili.borrowABook(bookName: davitisShutkebi)
baksi.borrowABook(bookName: howToBell)

zahesiLibrary.showAvailableBooks()

// წიგნის დაბრუნება
kharatishvili.returnABook(bookName: davitisShutkebi)
kharatishvili.returnABook(bookName: developInSwift)

zahesiLibrary.showAvailableBooks()


// დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.
zahesiLibrary.showBorrowedBooks()
print("\n")
zahesiLibrary.borrowedBy(person: kharatishvili)
zahesiLibrary.borrowedBy(person: baksi)




// OPTIONAL

// შექმენით კლასი გამონათქვამების გენერატორი, სადაც განმარტავთ გამონათქვამს-ს რომელიც იქნება სტრინგებისგან შემდგარი კოლექცია. შექმენით მეთოდი სადაც დააბრუნებთ შერჩევითად სხვადასხვა ჯოუქს და დაბეჭდავთ მას, ასევე ჩაამატეთ მეთოდი, რომელიც ჩასვამს ან ამოაკლებს გამონათქვამს სიიდან. მოცემული გაქვთ “ქილერ” გამონათქვამების სია:

class killaSayings {
    var sayings: [String] = []
    init(sayings: [String]) {
        self.sayings = sayings
    }

    func addSaying(phrase: String) {
        sayings.append(phrase)
        print("\nფრაზა - \(phrase) - დაემატა ფრაზათა კონას")
    }

    func randomSaying() {
        var randomNum = Int.random(in: 0 ... sayings.count - 1)
        print("\nრენდომ ფრაზა :  \(sayings[randomNum])")
    }

    func showPhrases() {
        print("\nფრაზათა კონაში შემავალი ფრაზებია: ")
        for saying in sayings {
            print("• \(saying)")
        }
    }

    func removeSaying(phrase: String) {
        if let phraseIndex = sayings.firstIndex(of: phrase) {
            sayings.remove(at: phraseIndex)
            print("\nფრაზა - \(sayings[phraseIndex]) -  ამოშლილია ფრაზათა კონიდან")
        } else {
            print("ეგეთი სიბრძნე ჯერ არ თქმულა")
        }
    }
}

var frazataKona = killaSayings(sayings: ["დავინახე თუ არა მივხვდი, რომ – დევიღუპე. ",
                                         "ისეთი აფერისტია, რომ ბანკომატებიც კი აძლევენ ფულს ვალად",
                                         "სულის ტკივილამდე ვტკივილობ…",
                                         "იმედის შუქი ჩამიქრა ვინმემ ასანთი მათხოვეთ",
                                         "არავინაა უნიკალური…მე არავინ ვარ…ე.ი უნიკალური ვარ"])

frazataKona.randomSaying()

frazataKona.addSaying(phrase: "ბავშვი როგორ დაკარგეთ ☠️☠️☠️")
// firstEdition.randomSaying()

frazataKona.showPhrases()

frazataKona.removeSaying(phrase: "სულის ტკივილამდე ვტკივილობ…")

frazataKona.showPhrases()
