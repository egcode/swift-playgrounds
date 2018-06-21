
import Foundation

class HTMLElement {
    
    let name: String
    let text: String?
    var closure:(() -> String)?
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    func asHTML(_ completion: @escaping () -> String) -> String {
        self.closure = completion
        return completion()
    }
    
    func printClosure() -> String  {
        return self.asHTML({
            [unowned self] in
            if let text = self.text {
                return "<\(self.name)>\(text)</\(self.name)>"
            } else {
                return "<\(self.name) />"
            }
        })
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}


var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.printClosure())

paragraph = nil
//Should print: p is being deinitialized
