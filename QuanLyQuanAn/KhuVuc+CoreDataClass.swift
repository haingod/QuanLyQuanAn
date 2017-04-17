//
//  KhuVuc+CoreDataClass.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData

@objc(KhuVuc)
public class KhuVuc: NSManagedObject {

    static let entityName = "KhuVuc"
    
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
    
    // Tìm một khuvuc bằng ten
    static func getBy(khuvuc ten: String) -> KhuVuc? {
        let fetchRequest: NSFetchRequest<BanAn> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "ten == %@", ten)
        
        do {
            if let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [KhuVuc] {
                if list.count > 0 {
                    return list[0]
                }
                return nil
            }
        }catch let error as NSError{
            print("Cannot get Khuvuc by ten, \(error), \(error.userInfo)");
        }
        
        return nil
    }
    
    // Chèn một khuvuc vào CSDl
    static func insert(ten:String,mota:String) -> KhuVuc? {
        let newkhuvuc = create() as! KhuVuc
        newkhuvuc.mota = mota
        newkhuvuc.ten = ten
        do{
            try DB.MOC.save()
            return newkhuvuc
        } catch let error as NSError{
            print("Cannot insert, \(error), \(error.userInfo)");
        }
        
        return nil
    }
    
    // Kiểm tra coi có hay chưa, nếu chưa có thì chèn vào, nếu có rồi thì trả ra đối tượng
    static func findAndCreate(ten:String,mota:String) -> KhuVuc? {
        if let tag = getBy(khuvuc: ten) {
            return tag
        } else {
            return insert(ten:ten,mota:mota)
        }
    }
    
    // Lấy tất cả các banan thuộc khuvuc nhất định
    static func getBanAns(by khuvuc: Int32) -> [BanAn] {
        let fetchRequest:NSFetchRequest<KhuVuc> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "ten == %@", khuvuc)
        
        do {
            let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [KhuVuc]
            let item = list.first!
            
            return item.banans?.array as! [BanAn]
        } catch let error as NSError {
            print("Cannot fetch banans, error: \(error), \(error.userInfo)")
            return []
        }
    }
    //Swap
    static func swap(source:Int,end:Int){
        var ds = KhuVuc.all() as! [KhuVuc]
        let mota = ds[source].mota
        let ten = ds[source].ten
        let banan = ds[source].banans
        let hinhanh = ds[source].hinhanhs
        
        ds[source].mota =  ds[end].mota
        ds[source].ten =  ds[end].ten
        ds[source].banans = ds[end].banans
        ds[source].hinhanhs = ds[end].hinhanhs
        
        ds[end].mota = mota
        ds[end].ten = ten
        ds[end].banans = banan
        ds[end].hinhanhs = hinhanh
        
        
        DB.save()
    }
    

}
