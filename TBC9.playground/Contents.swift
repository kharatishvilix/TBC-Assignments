import UIKit

// 1. შექმენით ენამი Gender სადაც იქნება 2 გენდერი (გენდერზე არ გამომეკიდოთ, თუ გინდათ მეტი ჩაამატეთ)

enum Gender {
    case Male, Female
}

// 2. შექმენით Protocol სახელად SuperBeing. გაუწერეთ მას ფროფერთები - name: String, strength: Int, speed: Int, weakness: String, gender: Gender

protocol SuperBeing {
    var name: String { get }
    var strength: Int? { get }
    var speed: Int? { get }
    var weakness: String { get }
    var gender: Gender { get }
}

// 3. SuperBeing-ის strength-სა და speed-ს მიეცით default მნიშვნელობა

extension SuperBeing {
    var strength: Int? {
        return 0
    }

    var speed: Int? {
        return 0
    }
}

// 4. შექმენით კლასები Superhero და SuperVillain, დაუქონფორმეთ SuperBeing-ს.

class SuperHero: SuperBeing {
    var strength: Int?

    var speed: Int?

    var name: String

    var weakness: String

    var gender: Gender

    init(name: String, strength: Int? = nil, speed: Int? = nil, weakness: String, gender: Gender) {
        self.name = name
        self.speed = speed
        self.strength = strength
        self.weakness = weakness
        self.gender = gender
    }

    // 6. გაუწერეთ Superhero კლასს მეთოდი - rescue, რომელიც პარამეტრად მიიღებს დაზარალებულის სახელს და დაბეჭდავს - “‘სუპერგმირის სახელი’ არ შეუშინდა სახიფათო სიტუაციას და ‘დაზარალებულის სახელი’ გადაარჩინა სიკვდილს” (მაგ: “ბეტმენი” არ შეუშინდა სახიფათო სიტუაციას და “გელა” გადაარჩინა სიკვდილს).

    func rescue(rescued: String) {
        print("\(name) არ შეუშინდა სიკვდილს და გადაარჩინა \(rescued)")
    }

    // 7. გაუწერეთ Superhero კლასს მეთოდი - combat, რომელიც პარამეტრად მიიღებს Supervillain-ს და დაბეჭდავს -“‘სუპერგმირის სახელი’ შეერკინა და დაამარცხა ‘ბოროტმოქმედის სახელი’” (მაგ: “ბეტმენი” შეერკინა და დაამარცხა “ჯოკერი”)

    func combat(villainName: SuperVillain) {
        print("\(name) შეერკინა და დაამარცხა \(villainName.name)")
    }
}

class SuperVillain: SuperBeing {
    var name: String

    var strength: Int?

    var speed: Int?

    var weakness: String

    var gender: Gender

    init(name: String, strength: Int?, speed: Int?, weakness: String, gender: Gender) {
        self.name = name
        self.speed = speed
        self.weakness = weakness
        self.gender = gender
    }
}

// ❗️❗️❗️ვინაიდან არ იყო დაზუსტებული, extension - ით უნდა გამეკეთებინა თუ არა, ზოგიერთი სუპერჰიროს მეთოდები კლასშივე ჩავწერე და ამას ექსთენშენით დავამატე.❗️❗️❗️
// 9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს - “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)
extension SuperVillain {
    func attack(hero: SuperHero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს")
    }
}


// 10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს - “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)
extension SuperVillain {
    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}

// 5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

extension SuperHero {
    var outfitColor: String {
        get {
            return UserDefaults.standard.string(forKey: "outfitColor") ?? "No outfit"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "outfitColor")
        }
    }

    var vehicle: String {
        get {
            return UserDefaults.standard.string(forKey: "vehicle") ?? "No vehicle"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "vehicle")
        }
    }
}

// 8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

extension SuperVillain {
    var evilScheme: String {
        get {
            return UserDefaults.standard.string(forKey: "evilScheme") ?? "No evil schemes yet."
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "evilScheme")
        }
    }

    var obsession: String {
        get {
            return UserDefaults.standard.string(forKey: "obsession") ?? "No obsessions."
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "obsession")
        }
    }

    var rivalry: String {
        get {
            return UserDefaults.standard.string(forKey: "rivalry") ?? "No rivalries atm."
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "rivalry")
        }
    }
}


// 11.შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

let batman = SuperHero(name: "Batman", strength: 90, speed: 80, weakness: "Day(?)", gender: .Male)
let spaidermeni = SuperHero(name: "Spider Man", strength: 100, speed: 100, weakness: "Goblini", gender: .Male)
let zakharichi = SuperHero(name: "Bidzina Tabagari", strength: 40, speed: 20, weakness: "Zeragia", gender: .Male)
let captainAmerica = SuperHero(name: "Captain America", weakness: "idk", gender: .Male)
let ironMan = SuperHero(name: "Tony Stark", weakness: "The existence of Thor", gender: .Male)

let joker = SuperVillain(name: "Joker", strength: 40, speed: 30, weakness: "Batman", gender: .Male)
let shavikata = SuperVillain(name: "Chorna", strength: 99, speed: 100, weakness: "", gender: .Female)
let beka = SuperVillain(name: "Beka", strength: 999999, speed: 100, weakness: "Martivi amocanebis wera", gender: .Male)
let painter = SuperVillain(name: "Austrian Painter", strength: 50, speed: 40, weakness: "That guy from Gori", gender: .Male)
let vader = SuperVillain(name: "Darth Vader", strength: 80, speed: 80, weakness: "Lightning", gender: .Male)

batman.rescue(rescued: "გელა")
batman.combat(villainName: joker)
joker.attack(hero: batman)
joker.experimentation(subject: "გელა")


// //ესენი შევამოწმე და მუშაობს 🔴
// spaidermeni.outfitColor = "red"
// print(spaidermeni.outfitColor)
// print(joker.evilScheme)
// joker.evilScheme = "This scheme is encrypted"
// print(joker.evilScheme)


// OPTIONALS
// წარმოიდგინეთ სცენა სადაც ორი სუპერგმირი - დრეიკი და ლექს-სენი ერთმანეთს ეჯიბრებიან თუ რომელი უფრო სწრაფია. დრეიკი ამბობს რომ ის ყველაზე სწრაფია მსოფლიოში და რიანაც უდასტურებს.
//
// -“ლექს-სენს არცერთი შეჯიბრი არ წაუგია ისტორიაში” აცხადებს მისი კოლაბორატორი თაკო და დასძენს, რომ დრეიკი შიშისაგან უნდა კანკალებდეს, რადგან არც კი იცის რა ელოდება. ამ სუპერგმირების ბედი თქვენზეა დამოკიდებული, თქვენ უნდა გადაწყვიტოთ ვინ არის მსოფლიოში ყველაზე სწრაფი და ვინ შეძლებს ბილბორდის ტოპ ჩარტების განადგურებას.
//
//
//
// 1. დაწერეთ ჯენერიკ ფუნქცია compareSwiftness რომელიც იღებს მხოლოდ ორ პარამეტრს პირველ და მეორე სუპერგმირებს რომლებიც დაქვემდებარებულები იქნებიან SuperBeing პროტოკოლზე, ფუნქცია უნდა აბრუნებდეს სტრინგს
// 2. ფუნქციის ბადიში შეამოწმეთ speed მნიშვნელობები ორივე სუპერგმირის
// 3. დააბრუნეთ სტრინგი აღწერით თუ რომელი სუპერგმირია უფრო სწრაფი (გაითვალისწინეთ ისიც თუ სიჩქარეები ერთმანეთის ტოლია)

func compareSwiftness<T: SuperBeing>(superHero1: T, superHero2: T) -> String {
    var hero1Speed = 0
    var hero2Speed = 0
    if let temp = superHero1.speed {
        hero1Speed = temp
    }
    if let temp2 = superHero2.speed {
        hero2Speed = temp2
    }

    if hero1Speed > hero2Speed {
        return "\(superHero1.name) უფრო სწრაფია (\(hero1Speed)), ვიდრე \(superHero2.name) (\(hero2Speed))"
    } else if hero1Speed < hero2Speed {
        return "\(superHero2.name) უფრო სწრაფია (\(hero2Speed)), ვიდრე \(superHero1.name) (\(hero1Speed))"
    } else {
        return "ორივე სუპერგმირს ერთნაირი სისწრაფე აქვთ (\(hero1Speed))."
    }
}

print(compareSwiftness(superHero1: joker, superHero2: beka))
