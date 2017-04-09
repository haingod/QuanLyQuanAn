//
//  BanAn+CoreDataClass.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData

@objc(BanAn)
public class BanAn: NSManagedObject {

    static let entityName = "BanAn"
    
    // Lấy tất cả danh sách
    static func all() -> [NSManagedObject] {
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: entityName)
        do {
            let idSort = NSSortDescriptor(key: "soban", ascending: true)
            fetchRequest.sortDescriptors = [idSort]
            let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [NSManagedObject]
            return list
        } catch let error as NSError {
            print("Cannot get all from entity \(entityName), error: \(error), \(error.userInfo)")
            return []
        }
    }
    
    // Xoa tất cả danh sách
    static func deleteall(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        
        do {
            try DB.MOC.execute(deleteRequest)
        } catch _ as NSError {
            // TODO: handle the error
        }
    }
    
    // Tạo mới một đối tượng để chèn vào CSDl
    static func create() -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: DB.MOC)
    }
    
    // Tìm một banan bằng soban
    static func getBy(banan soban: Int32) -> BanAn? {
        let fetchRequest: NSFetchRequest<BanAn> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "soban == %@", soban)
        
        do {
            if let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [BanAn] {
                if list.count > 0 {
                    return list[0]
                }
                return nil
            }
        }catch let error as NSError{
            print("Cannot get Tag by tagname, \(error), \(error.userInfo)");
        }
        
        return nil
    }
    
    // Chèn một banan vào CSDl
    static func insert(soban:Int32,thongtin:String,tinhtrang:Bool) -> BanAn? {
        let newbanan = create() as! BanAn
        newbanan.soban = soban
        newbanan.thongtin = thongtin
        newbanan.tinhtrang = tinhtrang
        do{
            DB.save()
            return newbanan
        } catch let error as NSError{
            print("Cannot insert, \(error), \(error.userInfo)");
        }
        
        return nil
    }
    
    // Kiểm tra coi có hay chưa, nếu chưa có thì chèn vào, nếu có rồi thì trả ra đối tượng
    static func findAndCreate(soban: Int32,thongtin:String,tinhtrang:Bool) -> BanAn? {
        if let tag = getBy(banan: soban) {
            return tag
        } else {
            return insert(soban:soban,thongtin:thongtin,tinhtrang:tinhtrang)
        }
    }
    
    // Lấy tất cả các monan thuộc banan nhất định
    static func getMonAns(by soban: Int32) -> [MonAn] {
        let fetchRequest:NSFetchRequest<BanAn> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "soban == %@", soban)
        
        do {
            let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [BanAn]
            let item = list.first!
            
            return item.monans?.array as! [MonAn]
        } catch let error as NSError {
            print("Cannot fetch notes, error: \(error), \(error.userInfo)")
            return []
        }
    }

}
