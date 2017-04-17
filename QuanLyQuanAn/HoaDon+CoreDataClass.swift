//
//  HoaDon+CoreDataClass.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/14/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData

@objc(HoaDon)
public class HoaDon: NSManagedObject {

    static let entityName = "HoaDon"

    // Lấy tất cả danh sách
    static func all() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: entityName)
        
        do {
            let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [NSManagedObject]
            return list
        } catch let error as NSError {
            print("Cannot get all from entity \(entityName), error: \(error), \(error.userInfo)")
            return []
        }
        
    }
    // Tạo mới một đối tượng để chèn vào CSDl
    static func create() -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: DB.MOC)
    }
}
