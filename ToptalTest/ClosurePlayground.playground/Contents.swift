//: Playground - noun: a place where people can play

import UIKit




class BARPersistenceController: NSObject
{
    
    var closure: () = {() -> () in }()
    
   init (closure:() -> ()) {
        super.init()
        self.closure = closure()
        self.closure
    }
    
    
    
}


func myClosure() -> ()
{
    var x: Int = 5
    var y: Int = 5
    var z: Int = x + y
    x = z - y
    y = z
    z = x - z
    print(x,y,z)

}

let persitenceController: BARPersistenceController = BARPersistenceController.init(closure: myClosure)
print(persitenceController)