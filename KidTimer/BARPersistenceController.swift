//
//  BARPersistenceController.swift
//  KidTimer
//
//  Created by BenRussell on 3/24/17.
//  Copyright © 2017 BenRussell. All rights reserved.
//

import UIKit
import CoreData
import Foundation
import XCTest

class BARPersistenceController: NSObject {
    
    var closure: () = {() -> () in }()
    lazy var managedObjectContext: NSManagedObjectContext =
    {
        let modelURL = Bundle.main.url(forResource: "KidTimer", withExtension: "momd")
        let mom = NSManagedObjectModel(contentsOf: modelURL!)
        assert(mom != nil, "Error initializing mom from: \(modelURL)")
            
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom!)
            
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let storeURL = (urls[urls.endIndex-1]).appendingPathComponent("KidTimer.sqlite")
        
        var store:NSPersistentStore?
        do { store =  try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
        } catch {
            XCTFail("error creating store: \(error)")
        }
        
    
            
        var managedObjectContext = NSManagedObjectContext.init(concurrencyType: private​Queue​Concurrency​Type)
        managedObjectContext.persistentStoreCoordinator = psc
            
        return managedObjectContext
    }()
    var dataContext: NSManagedObjectContext
    
    init (closure:() -> ())
    {
        super.init()
        self.closure = closure()
    }
    
    

}
