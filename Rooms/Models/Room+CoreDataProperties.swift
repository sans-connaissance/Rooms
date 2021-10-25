//
//  Room+CoreDataProperties.swift
//  Rooms
//
//  Created by David Malicke on 10/25/21.
//
//

import Foundation
import CoreData
import UIKit


extension Room {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Room> {
        return NSFetchRequest<Room>(entityName: "Room")
    }

    @NSManaged public var name: String
    @NSManaged public var width: Double
    @NSManaged public var length: Double
    @NSManaged public var color: UIColor?

}

extension Room : Identifiable {

}
