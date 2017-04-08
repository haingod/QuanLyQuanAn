//
//  MonAn+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension MonAn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MonAn> {
        return NSFetchRequest<MonAn>(entityName: "MonAn");
    }

    @NSManaged public var ten: String?
    @NSManaged public var mota: String?
    @NSManaged public var giatien: Float
    @NSManaged public var hinhanhs: NSOrderedSet?
    @NSManaged public var donvitien: TienTe?

}

// MARK: Generated accessors for hinhanhs
extension MonAn {

    @objc(insertObject:inHinhanhsAtIndex:)
    @NSManaged public func insertIntoHinhanhs(_ value: HinhAnh, at idx: Int)

    @objc(removeObjectFromHinhanhsAtIndex:)
    @NSManaged public func removeFromHinhanhs(at idx: Int)

    @objc(insertHinhanhs:atIndexes:)
    @NSManaged public func insertIntoHinhanhs(_ values: [HinhAnh], at indexes: NSIndexSet)

    @objc(removeHinhanhsAtIndexes:)
    @NSManaged public func removeFromHinhanhs(at indexes: NSIndexSet)

    @objc(replaceObjectInHinhanhsAtIndex:withObject:)
    @NSManaged public func replaceHinhanhs(at idx: Int, with value: HinhAnh)

    @objc(replaceHinhanhsAtIndexes:withHinhanhs:)
    @NSManaged public func replaceHinhanhs(at indexes: NSIndexSet, with values: [HinhAnh])

    @objc(addHinhanhsObject:)
    @NSManaged public func addToHinhanhs(_ value: HinhAnh)

    @objc(removeHinhanhsObject:)
    @NSManaged public func removeFromHinhanhs(_ value: HinhAnh)

    @objc(addHinhanhs:)
    @NSManaged public func addToHinhanhs(_ values: NSOrderedSet)

    @objc(removeHinhanhs:)
    @NSManaged public func removeFromHinhanhs(_ values: NSOrderedSet)

}
