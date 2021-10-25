//
//  CoreDataManager.swift
//  Rooms
//
//  Created by David Malicke on 10/25/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    
    init() {
        persistentContainer = NSPersistentContainer(name: "RoomModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize CoreData \(error)")
            }
            
        }
        
    }
    
    func save() {
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save movie!")
        }
        
    }
    
}
