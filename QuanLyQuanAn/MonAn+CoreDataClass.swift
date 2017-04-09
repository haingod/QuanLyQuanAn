//
//  MonAn+CoreDataClass.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/8/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import Foundation
import CoreData

@objc(MonAn)
public class MonAn: NSManagedObject {

    static let entityName = "MonAn"
    
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
    
    //Swap
    static func swap(source:Int,end:Int){
       /* var ds = MonAn.all() as! [MonAn]
        let ho = ds[source].ho
        let ten = ds[source].ten
        let khac = ds[source].khac
        let ngaysinh = ds[source].ngaysinh
        let lop = ds[source].thuoclop
        let hinh = ds[source].chuahinhanh
        
        ds[source].ho =  ds[end].ho
        ds[source].ten =  ds[end].ten
        ds[source].khac = ds[end].khac
        ds[source].ngaysinh = ds[end].ngaysinh
        ds[source].thuoclop = ds[end].thuoclop
        ds[source].chuahinhanh = ds[end].chuahinhanh
        
        ds[end].ho = ho
        ds[end].ten = ten
        ds[end].khac = khac
        ds[end].ngaysinh = ngaysinh
        ds[end].thuoclop = lop
        ds[end].chuahinhanh = hinh
        */
        DB.save()
    }
    
    // Chèn một monan vào CSDl
    static func insert(ten:String,mota:String,giatien:Float) -> MonAn? {
        let newmonan = create() as! MonAn
        newmonan.ten = ten
        newmonan.mota = mota
        newmonan.giatien = giatien
        do{
            DB.save()
            return newmonan
        } catch let error as NSError{
            print("Cannot insert, \(error), \(error.userInfo)");
        }
        
        return nil
    }
    // Tìm một monan
    static func getBy(monan ten: String) -> MonAn? {
        let fetchRequest: NSFetchRequest<MonAn> = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "ten == %@", ten)
        
        do {
            if let list = try DB.MOC.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as? [MonAn] {
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
    
    // Kiểm tra coi có hay chưa, nếu chưa có thì chèn vào, nếu có rồi thì trả ra đối tượng
    static func findAndCreate(ten:String,mota:String,giatien:Float) -> MonAn? {
        if let tag = getBy(monan: ten) {
            return tag
        } else {
            return insert(ten:ten,mota:mota,giatien:giatien)
        }
    }
    // Tạo mới một đối tượng để chèn vào CSDl
    static func create() -> NSManagedObject {
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: DB.MOC)
    }

}
