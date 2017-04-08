//
//  HinhAnh+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension HinhAnh {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HinhAnh> {
        return NSFetchRequest<HinhAnh>(entityName: "HinhAnh");
    }

    @NSManaged public var data: NSData?

}
