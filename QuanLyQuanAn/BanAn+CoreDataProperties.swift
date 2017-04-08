//
//  BanAn+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension BanAn {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BanAn> {
        return NSFetchRequest<BanAn>(entityName: "BanAn");
    }

    @NSManaged public var soban: Int32
    @NSManaged public var thongtin: String?
    @NSManaged public var tinhtrang: Bool
    @NSManaged public var hinhanhs: NSOrderedSet?
    @NSManaged public var khuvuc: KhuVuc?
    @NSManaged public var monans: NSOrderedSet?

}

// MARK: Generated accessors for hinhanhs
extension BanAn {

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

// MARK: Generated accessors for monans
extension BanAn {

    @objc(insertObject:inMonansAtIndex:)
    @NSManaged public func insertIntoMonans(_ value: MonAn, at idx: Int)

    @objc(removeObjectFromMonansAtIndex:)
    @NSManaged public func removeFromMonans(at idx: Int)

    @objc(insertMonans:atIndexes:)
    @NSManaged public func insertIntoMonans(_ values: [MonAn], at indexes: NSIndexSet)

    @objc(removeMonansAtIndexes:)
    @NSManaged public func removeFromMonans(at indexes: NSIndexSet)

    @objc(replaceObjectInMonansAtIndex:withObject:)
    @NSManaged public func replaceMonans(at idx: Int, with value: MonAn)

    @objc(replaceMonansAtIndexes:withMonans:)
    @NSManaged public func replaceMonans(at indexes: NSIndexSet, with values: [MonAn])

    @objc(addMonansObject:)
    @NSManaged public func addToMonans(_ value: MonAn)

    @objc(removeMonansObject:)
    @NSManaged public func removeFromMonans(_ value: MonAn)

    @objc(addMonans:)
    @NSManaged public func addToMonans(_ values: NSOrderedSet)

    @objc(removeMonans:)
    @NSManaged public func removeFromMonans(_ values: NSOrderedSet)

}
