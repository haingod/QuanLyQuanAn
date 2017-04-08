//
//  KhuVuc+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension KhuVuc {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KhuVuc> {
        return NSFetchRequest<KhuVuc>(entityName: "KhuVuc");
    }

    @NSManaged public var ten: String?
    @NSManaged public var mota: String?
    @NSManaged public var banans: NSOrderedSet?
    @NSManaged public var hinhanhs: NSOrderedSet?

}

// MARK: Generated accessors for banans
extension KhuVuc {

    @objc(insertObject:inBanansAtIndex:)
    @NSManaged public func insertIntoBanans(_ value: BanAn, at idx: Int)

    @objc(removeObjectFromBanansAtIndex:)
    @NSManaged public func removeFromBanans(at idx: Int)

    @objc(insertBanans:atIndexes:)
    @NSManaged public func insertIntoBanans(_ values: [BanAn], at indexes: NSIndexSet)

    @objc(removeBanansAtIndexes:)
    @NSManaged public func removeFromBanans(at indexes: NSIndexSet)

    @objc(replaceObjectInBanansAtIndex:withObject:)
    @NSManaged public func replaceBanans(at idx: Int, with value: BanAn)

    @objc(replaceBanansAtIndexes:withBanans:)
    @NSManaged public func replaceBanans(at indexes: NSIndexSet, with values: [BanAn])

    @objc(addBanansObject:)
    @NSManaged public func addToBanans(_ value: BanAn)

    @objc(removeBanansObject:)
    @NSManaged public func removeFromBanans(_ value: BanAn)

    @objc(addBanans:)
    @NSManaged public func addToBanans(_ values: NSOrderedSet)

    @objc(removeBanans:)
    @NSManaged public func removeFromBanans(_ values: NSOrderedSet)

}

// MARK: Generated accessors for hinhanhs
extension KhuVuc {

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
