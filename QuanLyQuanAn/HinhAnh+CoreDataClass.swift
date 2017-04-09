//
//  HinhAnh+CoreDataClass.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData

@objc(HinhAnh)
public class HinhAnh: NSManagedObject {

    static let entityName = "HinhAnh"
    
    // Tạo mới một đối tượng để chèn vào CSDl
    static func create() -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: DB.MOC)
    }
}
