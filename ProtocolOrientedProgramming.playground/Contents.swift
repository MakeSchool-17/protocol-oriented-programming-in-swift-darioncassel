//: Playground - noun: a place where people can play

import Cocoa

/**
Vehicles can have different properties and functionality.

All Vehicles:
  - Have a speed at which they move
  - Calculate the duration it will take them to travel a certain distance

All Vehicles except a Motorcycle and a Container Ship:
  - Have an amount of Windows

Only Ground Vehicles:
  - Have an amount of wheels

Only Buses:
  - Have a seating capacity

Only Vessels:
  - Have a length

Create the following Vehicles types: Car, Bus, ContainerShip, Boat, Motorcycle

----

The solution below does not use protocols, it relies solely on subclassing. Can you use protocols to improve the solution?
**/



typealias KilometersPerHour = Double
typealias Kilometers = Double
typealias Hours = Double

protocol Moveable {
    var speed: KilometersPerHour { get set }
}
protocol Vehicle {
    var wheels: Int { get set }
}
protocol Enclosed {
    var amountOfWindows: Int { get set }
}
protocol Vessel {
    var length: Int { get set }
}

extension Moveable {
    func travelDuration(distance: Kilometers) -> Hours {
        return distance / speed
    }
}


struct Car: Moveable, Vehicle, Enclosed {
    var speed: KilometersPerHour = 0
    var amountOfWindows: Int = 0
    var wheels: Int = 4
}

struct MotorCycle: Moveable, Vehicle {
    var speed: KilometersPerHour = 0
    var wheels: Int = 2
}
struct Bus: Moveable, Vehicle, Enclosed {
    var speed: KilometersPerHour = 0
    var capacity: Int = 0
    var amountOfWindows: Int = 0
    var wheels: Int = 4
}
struct Boat: Moveable, Vessel, Enclosed {
    var speed: KilometersPerHour = 0
    var length: Int = 0
    var amountOfWindows: Int = 0
  
}
struct ContainerShip: Moveable, Vessel {
    var speed: KilometersPerHour = 0
    var length: Int = 0
}


var car = Car()
car.amountOfWindows = 6
car.speed = 120
print(car.wheels)

var bus = Bus()
bus.amountOfWindows = 20
bus.speed = 100

var boat = Boat()
boat.amountOfWindows = 8
boat.speed = 30

var containerShip = ContainerShip()
containerShip.speed = 30

var motorcycle = MotorCycle()
motorcycle.speed = 130

let vehicles: [Moveable] = [car, bus, boat, containerShip, motorcycle]

for v in vehicles {
    var amountOfWindowsSubstring = ""

    if let boat = v as? Boat {
        amountOfWindowsSubstring = "\(boat.dynamicType) has \(boat.amountOfWindows) windows and"
    } else if let car = v as? Car {
        amountOfWindowsSubstring = "\(car.dynamicType) has \(car.amountOfWindows) windows and"
    } else if let bus = v as? Bus {
        amountOfWindowsSubstring = "\(bus.dynamicType) has \(bus.amountOfWindows) windows and"
    }

    print("\(v.dynamicType)\(amountOfWindowsSubstring) needs \(v.travelDuration(100)) to travel 100 kilometers.")
}
