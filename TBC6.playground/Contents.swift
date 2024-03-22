import UIKit

// 1. შექმენით Enum-ი სახელით WeekDay შესაბამისი ქეისებით. დაწერეთ ფუნქცია რომელიც იღებს ამ ენამის ტიპს და ბეჭდავს გადაწოდებული დღე სამუშაოა თუ დასვენების.

enum WeekDay {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func workDayCheck(on day: WeekDay) {
    switch day {
    case .saturday:
        print("Saturday არის დასვენების დღე")
    case .sunday:
        print("Sunday არის დასვენების დღე")
    default:
        print("\(day) არის სამუშაო დღე")
    }
}

workDayCheck(on: .friday)

print("\n")
// 2. შექმენით Enum-ი სახელად GialaSquad, რომელიც აღწერს გია სურამელაშვილის ფანკლუბის წევრების დონეებს ქეისებით : “TsigroviManto”, “MoshishvlebuliMkerdi”, “TuGapatio”. შექმენით ფროფერთი GialaSquad-ში, რომელსაც ექნება ინფორმაცია თუ რა ღირს თითოეული დონე თვეში (დონეები დალაგებულია ძვირიდან იაფისაკენ). დაუმატეთ მეთოდი რომელიც დაბეჭდავს თითოეული დონის ფასს

// AYO WHO WROTE THIS ☠️☠️☠️☠️☠️☠️☠️☠️☠️


enum GialaSquad {
    case TsigroviManto
    case MoshishvlebuliMkerdi
    case TuGapatio

    var subscriptionPrice: Int {
        switch self {
        case .TsigroviManto:
            return 30000
        case .MoshishvlebuliMkerdi:
            return 10000
        case .TuGapatio:
            return 5000
        }
    }

    func showPrices() {
        print(subscriptionPrice)
    }
}

GialaSquad.MoshishvlebuliMkerdi.showPrices()


print("\n")
// 3.შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(temperature: Int), Cloudy(temperature: Int), Rainy(temperature: Int), Snowy(temperature: Int)
}

func whatToWear(when its: Weather) {
    switch its {
    case var .Sunny(temperature):
        if temperature > 30 {
            print("\(temperature) გრადუსია და მზეა. საერთოდ ნუ ჩაიცვამ ნურაფერს ☠️")
        } else if temperature > 20 {
            print("\(temperature) გრადუსია და მზიანი ამინდია, მოკლე მკლავიანების დროა")
        } else {
            print("\(temperature) გრადუსია და მზიანი ამინდია,  ბევრი არ ჩაიცვა")
        }
    case var .Cloudy(temperature):
        if temperature > 30 {
            print("\(temperature) გრადუსია და მოღრუბლულია. ")
        } else if temperature > 15 {
            print("\(temperature) გრადუსია და მოღრუბლულია. შეიძლება იწვიმოს. ქოლგა წაიღე")
        } else {
            print("მოღრუბლულია და \(temperature) გრადუსია, ქოლგა წაიღე, უეჭველი იწვიმებს")
        }

    case var .Rainy(temperature):
        if temperature > 20 {
            print("\(temperature) გრადუსია და წვიმს. ქოლგა წაიღე")
        } else if temperature > 5 {
            print("\(temperature) გრადუსია და წვიმს. თბილად ჩაიცვი და ქოლგა წაიღე")
        } else {
            print("\(temperature) გრადუსია, მაააგრა ცივა და თბილად ჩაიცვი")
        }

    case var .Snowy(temperature):
        if temperature < 10 {
            print("\(temperature) გრადუსია. თოვს, ქუდი დაიხურე.")
        } else {
            print("თუ \(temperature) გრადუსია და თოვს, არყოფილა საქმე კარგად, არაფრის ჩაცმას აზრი აღარ აქვს ☠️. ")
        }
    }
}

whatToWear(when: .Snowy(temperature: 30))
whatToWear(when: .Sunny(temperature: 18))

print("\n")
// 4. შექმენით struct-ი Kanye, ფროფერთებით: album, releaseYear. ამის შემდეგ შექმენით array-ი Kanye-ს ტიპის, ჩაამატეთ რამოდენიმე Kanye-ს ობიექტი, და შეავსეთ მასივი კანიეებით. დაწერეთ ფუნქცია, რომელიც მიიღებს ამ კანიეების მასივს და წელს. ფუნქციამ უნდა დაგვიბრუნოს ყველა ალბომი რომელიც გამოშვებულია გადაწოდებული წლის შემდეგ და დაბეჭდოს ისინი.

struct Kanye {
    var album: String
    var releaseYear: UInt
}

var kanyeTypeArray: [Kanye] = []
kanyeTypeArray.append(Kanye(album: "Graduation", releaseYear: 2007))
kanyeTypeArray.append(Kanye(album: "Jesus is king", releaseYear: 2018))
kanyeTypeArray.append(Kanye(album: "Yeezus", releaseYear: 2013))

func kanyeFunc(kanyeArray: [Kanye], year: Int) -> [String] {
    var albumsToReturn: [String] = []
    print("\(year) წლის შემდეგ გამოსული ალბომებია : ")
    for i in kanyeArray {
        if year < i.releaseYear {
            albumsToReturn.append(i.album)
        }
    }
    for album in albumsToReturn {
        print(album)
    }
    return albumsToReturn
}

kanyeFunc(kanyeArray: kanyeTypeArray, year: 2010)


print("\n")


// 5.შექმენით String-ის ტიპის lazy property wrapper სახელად, cachedData. ინიციალიზება გაუკეთეთ ქლოჟერით რომელიც აბრუნებს სტრინგს მნიშვნელობით “lazy ინიციალიზებულია”. მიწვდით ამ ფროფერთის და დაბეჭდეთ მისი მნიშვნელობა


@propertyWrapper struct CachedData {
    var wrappedValue: String {
        mutating get {
            return value
        }
    }

    lazy var value: String = self.initializer()
    let initializer: () -> String
    init(wrappedValue initializer: @escaping @autoclosure () -> String) {
        self.initializer = initializer
    }
}

struct newStruct {
    @CachedData var cachedData: String = "lazy ინიციალიზებულია."
}

var data = newStruct()

print(data.cachedData)
