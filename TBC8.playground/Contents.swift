import UIKit

// შევქმნათ Class Book.
// Properties: bookID(უნიკალური იდენტიფიკატორი Int), String title, String author, Bool isBorrowed.
// Designated Init.
// Method რომელიც ნიშნავს წიგნს როგორც borrowed-ს.
// Method რომელიც ნიშნავს წიგნს როგორც დაბრუნებულს.

class Book {
    let bookID: Int
    let title: String
    let author: String
    var isBorrowed: Bool

    init(bookID: Int, title: String, author: String, isBorrowed: Bool) {
        self.bookID = bookID
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
    var ownerID: Int
    var name: String
    var borrowedBooks: [String]

    init(ownerID: Int, name: String, borrowedBooks: [String]) {
        self.ownerID = ownerID
        self.name = name
        self.borrowedBooks = borrowedBooks
    }

    func borrowABook(bookName: Book) {
        if !bookName.isBorrowed {
            bookName.isBorrowed = true
            borrowedBooks.append(bookName.title)
        }
    }

    func returnABook(bookName: Book) {
        bookName.isBorrowed = false
        if let bookIndexInArray = borrowedBooks.firstIndex(of: bookName.title) {
            borrowedBooks.remove(at: bookIndexInArray)
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
//                Books.insert(bookName.title, at: bookName.bookID)
//        Book(bookID: bookName.bookID, title: bookName.title, author: bookName.author, isBorrowed: bookName.isBorrowed)
        Books.append(bookName)
    }

    func addOwners(ownerName: Owner) {
        Owners.append(ownerName)
    }

    func showAvailableBooks() {
        if Books.count > 0 {
            print("ბიბლიოთეკაში არსებული თავისუფალი წიგნებია : ")
            for i in Books {
                if !i.isBorrowed {
                    print("\(i.title)")
                }
            }
        } else {
            print("ყველა წიგნი წაღებულია")
        }
    }
}


// წავაღებინოთ Owner-ებს წიგნები და დავაბრუნებინოთ რაღაც ნაწილი.
// დავბეჭდოთ ინფორმაცია ბიბლიოთეკიდან წაღებულ წიგნებზე, ხელმისაწვდომ წიგნებზე და გამოვიტანოთ წაღებული წიგნები კონკრეტულად ერთი Owner-ის მიერ.


// შევქმნათ რამოდენიმე წიგნი და რამოდენიმე Owner-ი, შევქმნათ ბიბლიოთეკა.
// დავამატოთ წიგნები და Owner-ები ბიბლიოთეკაში
var leavesOfGrass = Book(bookID: 0, title: "Leaves Of Grass", author: "Walter White", isBorrowed: false)
var vefkhistkaosani = Book(bookID: 1, title: "Vefkhistkaosani", author: "Shota Rustaveli", isBorrowed: false)
var developInSwift = Book(bookID: 2, title: "Develop In Swift Explorations", author: "Apple Education", isBorrowed: false)
var howToBell = Book(bookID: 3, title: "How to bell", author: "Batoni vasili", isBorrowed: false)
var davitisShutkebi = Book(bookID: 777, title: "Davitis citatebi lekciis msvlelobisas", author: "Chat", isBorrowed: false)



var kharatishvili = Owner(ownerID: 0, name: "Luka Kharatishvili", borrowedBooks: [])
var tetriKata = Owner(ownerID: 1, name: "Macivara", borrowedBooks: [])
var baksi = Owner(ownerID: 2, name: "Baksi", borrowedBooks: [])


var zahesiLibrary = Library(Books: [leavesOfGrass, vefkhistkaosani, developInSwift, howToBell, davitisShutkebi], Owners: [kharatishvili, tetriKata, baksi])


zahesiLibrary.showAvailableBooks()

print("\nwaigo 2 wigni\n")
kharatishvili.borrowABook(bookName: howToBell)
kharatishvili.borrowABook(bookName: davitisShutkebi)

zahesiLibrary.showAvailableBooks()


print("\ndaabruna 1 wigni\n")

kharatishvili.returnABook(bookName: davitisShutkebi)
zahesiLibrary.showAvailableBooks()
