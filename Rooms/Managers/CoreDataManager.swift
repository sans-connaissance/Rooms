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
    
    private init() {
        
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "RoomModel")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
    }
    
    func getAllRooms() -> [Room] {
        
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
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

