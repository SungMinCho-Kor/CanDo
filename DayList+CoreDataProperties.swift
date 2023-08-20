//
//  DayList+CoreDataProperties.swift
//  CanDo
//
//  Created by 조성민 on 2023/08/21.
//
//

import Foundation
import CoreData


extension DayList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayList> {
        return NSFetchRequest<DayList>(entityName: "DayList")
    }

    @NSManaged public var text: String?
    @NSManaged public var isHaveTo: Bool
    @NSManaged public var isCheck: Bool

}

extension DayList : Identifiable {

}
