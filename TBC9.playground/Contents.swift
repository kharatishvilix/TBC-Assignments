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

    init(name: String, strength: Int? = nil, speed: Int? = nil, weakness: String, gender: Gender) {
        self.name = name
        self.weakness = weakness
        self.gender = gender
    }

    // 9.გაუწერეთ SuperVillain კლასს მეთოდი - attack - რომელიც პარამეტრად მიიღებს Superhero-ს და დაბეჭდავს - “ბოროტმ. სახელი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “სუპერგმირის სახელი” მის შეჩერებას თუ შეძლებს” (მაგ: “ჯოკერი” გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა “ბეტმენი” მის შეჩერებას თუ შეძლებს)

    func attack(hero: SuperHero) {
        print("\(name) გეგმავს თავდასხმას და მთელი ქალაქის მიწასთან გასწორებას, საეჭვოა \(hero.name) მის შეჩერებას თუ შეძლებს")
    }

    // 10. გაუწერეთ SuperVillain კლასს მეთოდი experimentation - რომელიც პარამეტრად მიიღებს სტრინგს (subject) და დაბეჭდავს - “‘ბოროტმოქმედის სახელი’ ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად ‘მსხვერპლის სახელი’ აღმოჩნდა” (მაგ: “ჯოკერი” ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად “გელა” აღმოჩნდა)

    func experimentation(subject: String) {
        print("\(name) ექსპერიმენტებს ატარებს დაუცველ მოქალაქებზე, მისი მსხვერპლი ამჟამად \(subject) აღმოჩნდა")
    }
}



// 5. გაუწერეთ Superhero კლასს დამატებითი პარამეტრები outfitColor: String, equipment: String, vehicle: String

extension SuperHero {
    var outfitColor: String {
        return "No outfit"
    }

    var vehicle: String {
        return "No vehicle"
    }
}

// 8.გაუწერეთ SuperVillain კლასს დამატებითი პარამეტრები evilScheme: String, obsession: String, rivalry: String

extension SuperVillain {
    var evilScheme: String {
        return "No evilscheme yet"
    }

    var obsession: String {
        return "No obsessions"
    }

    var rivalry: String {
        return "No rivalries atm"
    }
}


// 11.შექმენით მინიმუმ 5-5 ობიექტი თითოეული SuperBeing-ის დაქონფირმებული კლასებიდან

let batman = SuperHero(name: "Batman", strength: 90, speed: 80, weakness: "day?", gender: .Male)
let spaidermeni = SuperHero(name: "Spider Man", strength: 100, speed: 100, weakness: "goblini", gender: .Male)
let zakharichi = SuperHero(name: "Bidzina Tabagari", strength: 40, speed: 20, weakness: "zeragia", gender: .Male)
let captainAmerica = SuperHero(name: "Captain America", weakness: "idk", gender: .Male)
let ironMan = SuperHero(name: "Tony Stark", weakness: "the existence of Thor", gender: .Male)

let joker = SuperVillain(name: "Joker", strength: 40, speed: 30, weakness: "Batman", gender: .Male)
let shavikata = SuperVillain(name: "Chorna", strength: 99, speed: 100, weakness: "", gender: .Female)
let beka = SuperVillain(name: "Beka", strength: 999999, speed: 100, weakness: "martivi amocanebis wera", gender: .Male)
let painter = SuperVillain(name: "Austrian Painter", strength: 50, speed: 40, weakness: "That guy from Gori", gender: .Male)
let vader = SuperVillain(name: "Darth Vader", strength: 80, speed: 80, weakness: "Lightning", gender: .Male)

batman.rescue(rescued: "გელა")
batman.combat(villainName: joker)
joker.attack(hero: batman)
joker.experimentation(subject: "გელა")
