//
//  TienTe+CoreDataProperties.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData


extension TienTe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TienTe> {
        return NSFetchRequest<TienTe>(entityName: "TienTe");
    }

    @NSManaged public var maso: Int32
    @NSManaged public var loaitien: String?

}
