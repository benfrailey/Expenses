//
//  Category+CoreDataProperties.swift
//  Expenses
//
//  Created by Ben Frailey on 4/19/19.
//  Copyright © 2019 Tech Innovator. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawExpenses: NSOrderedSet?

}
