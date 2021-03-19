//
//  ContentView.swift
//  Shared
//
//  Created by Ira Zozulya on 04.03.2021.
//

import SwiftUI

class Car {
    var name = "Car"
    init() { }
    init(name: String) {
        self.name = name
    }
}

class Tesla : Car {
    override init() { super.init() }
    override init(name: String) {
        super.init()
        self.name = name
    }
}

class Chevrolet : Car {
    var model: String = "Chevelle"
    init(name: String, model: String) {
        self.model = model
        super.init(name: name)
    }
    init(model: String) {
        super.init()
        self.model = model
    }
}


enum StudentType {
    case lazy
    case extremelyLazy
}

enum Students {
    case sleep(how: String, timeInMinutes: Int, type: StudentType)
    case eat(how: String, timeInMinutes: Int, type: StudentType)
}


protocol CountryProtocol {
    var name: String { get }
    var population: Int { get set }
    
    func selectLowerChar() -> Character
}

class Country: CountryProtocol {
    var name: String
    var population: Int
    init() {
        self.name = ""
        self.population = 0
    }
    init(name: String, population: Int) {
        self.name = name
        if population > -1 {
            self.population = population
        } else {
            self.population = 0
        }
    }
    
    func selectLowerChar() -> Character {
        let index = population % name.count
        return name.lowercased()[name.index(name.startIndex, offsetBy: index)]
    }
}


class RubeGoldbergMachine {
    var result: String
    init() {
        self.result = ""
    }
    
    func addRube () {
        //R
        let binary = "01010010"
        if let number = Int(binary, radix: 2) {
            let character = Character(UnicodeScalar(number)!)
            result += String(character)
        }
        
        //u
        let reversed = "urban".reversed()
        if let c = reversed.last {
            result += String(c)
        }

        //b
        var nilVal: Int?
        if nilVal != nil {
            result += "ssian huligans"
        }
        else {
            result += "b"
        }

        //e
        switch result {
        case "Russian huligans":
            result = "Well, stay in Russia"
        case "Rub":
            result = result + "e"
        default:
            break
        }
    }
    
    func addGoldberg() {
        //G
        result = addUpperCaseLetter(tmp: ["result": result])
        
        //o
        var count = 0
        for _ in 0..<result.count {
            count += 1
        }

        let cities = ["Kyiv", "Cherkasy", "Kharkiv", "Odesa", "Lviv", "Poltava", "Ivano-Frankivsk", "Donetsk"]
        if let oString = cities.first(where: {$0.contains("O")}) {
            result += String(oString.first!.lowercased())
        }
        
        //ld
        let tesla = Tesla(name:"Hopefully mine")

        let cars = [
            tesla,
            Chevrolet(name: "Chevrolet", model: "Impala"),
            Chevrolet(model: "Astra Sedan")
        ]

        for car in cars {
            if let car = car as? Chevrolet {
                if car.model == "Impala" || car.model == "Chevelle" {
                    let name = car.model
                    let index = name.index(name.startIndex, offsetBy: (name.count - 2))
                    result += String(name[index])
                } else {
                    if let index = car.model.firstIndex(of: "d") {
                        result += String(car.model[index])
                    }
                }
            }
        }
        
        //b
        result = addBLetter(res: result)
        
        //er
        let studentActions = [Students.sleep(how: "sweetly", timeInMinutes: 60, type: StudentType.extremelyLazy), Students.eat(how: "quickly", timeInMinutes: 5, type: StudentType.lazy)]
        
        for studentAction in studentActions {
            switch studentAction {
            case let .sleep(how, timeInMinutes, StudentType.lazy):
                result += String(how[how.index(how.startIndex, offsetBy: (timeInMinutes / 30))])
            case let .sleep(how, timeInMinutes, StudentType.extremelyLazy):
                result += String(how[how.index(how.startIndex, offsetBy: (timeInMinutes / 20))])
                
            case let .eat(how, timeInMinutes, _)
                where timeInMinutes < 10:
                if let number = how[how.startIndex].asciiValue {
                    let character = Character(UnicodeScalar(number + 1))
                    result += String(character)
                }
            default:
                break
            }
        }
        
        //g
        var arr = ["i", "g", "l", "o", "o"]
        arr.sort()
        if let str = arr.first {
            result.append(str)
        }
    }

    func addMachine() {
        //M
        result = addUpperCaseLetter(tmp: ["result": result, "letter": "M"])

        //a
        let tesla = Tesla()
        let name = tesla.name
        let index = name.index(after: name.startIndex)
        result += String(name[index])

        //chin
        let country = Country(name: "China", population: 0)
        while country.population < 4 {
            result += String(country.selectLowerChar())
            country.population += 1
        }
        
        //e
        result += addELetter(boiii: "Yeah boiii")
    }

    func addBLetter (res: String?) -> String {
        guard let res = res else {
            return "Oooops... Something went wrong!"
        }
        var animals: Set<String> = ["cat", "dog", "raccoon", "dog", "rabbit"]
        var cuties: Set<String> = ["dog", "raccoon", "rabbit"]
        for cutie in cuties {
            if cutie.last == "n" {
                cuties.remove(cutie)
            }
        }
        animals.remove("dog")
        if let rabbit = animals.intersection(cuties).first {
            let third = rabbit[rabbit.index(rabbit.startIndex, offsetBy: 2)]
            let fourth = rabbit[rabbit.index(rabbit.startIndex, offsetBy: 3)]
            if third == fourth {
                return res + String(third)
            }
        }
        return res
    }

    func addUpperCaseLetter (tmp: [String: String]) -> String {
        var str: String
        
        guard let res = tmp["result"] else {
            return "Oooops... Something went wrong!"
        }
        
        guard let g = tmp["letter"] else {
            return res + String("g".uppercased().first!)
        }
        
        str = g
        str = str.uppercased()
        return res + String(str.first!)
    }
    
    func addELetter (boiii: String) -> String {
        var result = ""
        if boiii.count != 0 {
            if boiii.first != "e" {
                let secondIndex = boiii.index(after: boiii.startIndex)
                let lastIndex = boiii.index(before: boiii.endIndex)
                result = addELetter(boiii: String(boiii[secondIndex..<lastIndex]))
            } else {
                result = String(boiii.first!)
            }
        }
        
        return result
    }
}

struct ContentView: View {
    var str: String
    var body: some View {
        Text(str)
            .padding()
    }
    init() {
        let rubeGoldbergMachine = RubeGoldbergMachine()
        rubeGoldbergMachine.addRube()

        if let next = rubeGoldbergMachine.result.count == 4 ? " " : "" {
            rubeGoldbergMachine.result += next
        }

        rubeGoldbergMachine.addGoldberg()

        if rubeGoldbergMachine.result.count == 13 {
            rubeGoldbergMachine.result += " "
        }

        rubeGoldbergMachine.addMachine()

        self.str = rubeGoldbergMachine.result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
