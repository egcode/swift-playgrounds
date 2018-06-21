//: Playground - noun: a place where people can play

import Foundation

protocol Exercise: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}
//Protocol Extension Default implementations
extension Exercise {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned), calories in \(minutes) minutes"
    }
}

struct EllipticalWorkout: Exercise {
    let name = "Elliptical Workout"
    let caloriesBurned: Double
    let minutes: Double
}

struct TreadmillWorkout: Exercise {
    let name = "TreadmillWorkout Workout"
    let caloriesBurned: Double
    let minutes: Double
    let laps: Double
}

let ellipticalWorkout = EllipticalWorkout(caloriesBurned: 200, minutes: 30)
let treadmillWorkout = TreadmillWorkout(caloriesBurned: 300, minutes: 25, laps: 10)


//Protocol Extension
extension Exercise {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
print(ellipticalWorkout.caloriesBurnedPerMinute)
print(treadmillWorkout.caloriesBurnedPerMinute)

//Protocol Extension 'where' Clauses
extension Sequence where Iterator.Element == Exercise {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}
let mondayWorkout: [Exercise] = [ellipticalWorkout, treadmillWorkout]
print(mondayWorkout.totalCaloriesBurned())


//Protocol Extension Override Default implementations
extension TreadmillWorkout {
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned), laps \(laps) calories in \(minutes) minutes"
    }
}

print(ellipticalWorkout)
print(treadmillWorkout)

