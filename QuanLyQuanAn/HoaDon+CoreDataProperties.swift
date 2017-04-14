//
//  HoaDon+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/14/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension HoaDon {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HoaDon> {
        return NSFetchRequest<HoaDon>(entityName: "HoaDon");
    }

    @NSManaged public var thoigian: NSDate?
    @NSManaged public var monans: NSSet?

}

// MARK: Generated accessors for monans
extension HoaDon {

    @objc(addMonansObject:)
    @NSManaged public func addToMonans(_ value: MonAn)

    @objc(removeMonansObject:)
    @NSManaged public func removeFromMonans(_ value: MonAn)

    @objc(addMonans:)
    @NSManaged public func addToMonans(_ values: NSSet)

    @objc(removeMonans:)
    @NSManaged public func removeFromMonans(_ values: NSSet)

}
