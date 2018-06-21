//: Playground - noun: a place where people can play

import Foundation

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    func label(forColumn column: Int) -> String
    func itemFor(row: Int, column: Int) -> String
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
    
    
    var numberOfRows: Int {
        return people.count
    }
    var numberOfColumns: Int {
        return 3
    }
    func label(forColumn column: Int) -> String {
        switch column {
        case 0: return "Employee Name"
        case 1: return "Age"
        case 2: return "Years of Experience"
        default: fatalError("Invalid column")
        }
    }
    func itemFor(row: Int, column: Int) -> String {
        let person = self.people[row]
        switch column {
        case 0: return person.name
        case 1: return String(person.age)
        case 2: return String(person.yearsOfExperience)
        default: fatalError("Invalid Column")
        }
    }
}

var department = Department(name: "ENgineering")
department.add(Person(name: "Joe", age: 48875876576, yearsOfExperience: 3))
department.add(Person(name: "Vasiliy", age: 32, yearsOfExperience: 5))
department.add(Person(name: "Ben", age: 65, yearsOfExperience: 12))


func printTable(_ dataSource: TabularDataSource) {
    //Create first row containing column headers
    var firstRow = "|"
    
    //Also keep track of the width of each column
    var columnWidth = [Int]()
    
    for i in 0 ..< dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: i)
        
        //Get width of column
        var widths = [Int]()
        for r in 0 ..< dataSource.numberOfRows {
            let item = dataSource.itemFor(row: r, column: i)
            widths.append(max(columnLabel.characters.count, item.characters.count))
        }
        //Getting width of a column
        guard let width = widths.max() else { return }
        let paddingNeeded = width - columnLabel.characters.count
        let padding = String(repeatElement(" ", count: paddingNeeded))
        firstRow += " \(columnLabel)\(padding) |"
        columnWidth.append(width)
    }
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Start the output string
        var out = "|"
        
        //Append each item in this row to the string
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemFor(row: i, column: j)
            let paddingNeeded = columnWidth[j] - item.characters.count
            let padding = String(repeatElement(" ", count: paddingNeeded))
            out += " \(padding)\(item) |"
        }
        
        //Done - print it!
        print(out)
    }
}

printTable(department)


