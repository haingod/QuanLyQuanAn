//
//  ViewControllerThongKeDoanhThu2.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/16/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import UIKit

class ViewControllerThongKeDoanhThu2: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var lbHeader: UITextView!
    
    @IBOutlet weak var txtTongCong: UITextField!
    
    var FromDate: Date? = nil
    var ToDate: Date? = nil
    var TongTienHoaDons: Float = 0
    var DsHoaDon:[HoaDon] = []
    func Load(){
        let cal = Calendar(identifier: .gregorian)
        FromDate = cal.startOfDay(for: self.FromDate!)
        ToDate = cal.date(bySettingHour: 23, minute: 59, second: 59, of: self.ToDate!)
        
        
        let ListHoaDon = HoaDon.all() as! [HoaDon]
        for hd in ListHoaDon{
            if(
                (hd.thoigian?.compare(FromDate!) == ComparisonResult.orderedDescending ||
                    hd.thoigian?.compare(FromDate!) == ComparisonResult.orderedSame) &&
                (hd.thoigian?.compare(ToDate!) == ComparisonResult.orderedAscending ||
                    hd.thoigian?.compare(ToDate!) == ComparisonResult.orderedSame)
              )
            {
                DsHoaDon.append(hd)
                TongTienHoaDons += getTienHoaDon(hoadon: hd)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let from = dateFormatter.string(from: FromDate! as Date)
        let to = dateFormatter.string(from: ToDate! as Date)

        lbHeader.text = "Thong ke doanh thu tu ngay " + from + " den ngay " + to
        Load()
        txtTongCong.text = String(format:"%.2f", TongTienHoaDons)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DsHoaDon.count
    }
    
    func getTienHoaDon(hoadon: HoaDon)->Float{
        var tongtien:Float = 0
        let monans = hoadon.monans?.allObjects as! [MonAn]
        for i in monans{
            tongtien += i.giatien
        }
        return tongtien
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellThongKe", for: indexPath) as! TbvCellThongKe
        let hd = DsHoaDon[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: hd.thoigian! as Date)
        
        cell.lbHoaDon.text = strDate + " /" + String(format:"%.2f", getTienHoaDon(hoadon: hd))
      
        return cell
    }


}
