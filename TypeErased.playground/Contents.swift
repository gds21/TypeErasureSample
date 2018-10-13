import UIKit

protocol Drinkable {
    var name: String { get }
    func drink()
}

struct AnyDrinkable: Drinkable {
    internal let _drink: Drinkable
    init<T: Drinkable>(_ drink: T) {
        _drink = drink
    }
    
    func drink() {
        _drink.drink()
    }
    var name: String {
        return _drink.name
    }
}

struct Coke: Drinkable {
    var name: String = "THECoke"

    func drink() {
        print("drink coke")
    }
}


extension AnyDrinkable: Hashable {
    static func == (lhs: AnyDrinkable, rhs: AnyDrinkable) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

extension AnyDrinkable: CustomStringConvertible {
    var description: String {
        return name
    }
}

let coke = AnyDrinkable(Coke())

let dict:[AnyDrinkable:String] = [coke:"200"]
