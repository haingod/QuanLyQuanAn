//
//  TableViewControllerKhuVuc.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/15/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import UIKit

class TableViewControllerKhuVuc: UITableViewController, DataEnteredDelegate {

    var ListKhuVuc:[KhuVuc]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ListKhuVuc = KhuVuc.all() as! [KhuVuc]
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ListKhuVuc.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellKhuVuc", for: indexPath) as! TbvCellKhuVuc
        let Khuvuc = ListKhuVuc[indexPath.row]
        
        let ten = Khuvuc.ten
        let mota = Khuvuc.mota

        
        let arrhinhanh = Khuvuc.hinhanhs?.array as! Array<HinhAnh>
        if arrhinhanh.count > 0{
            let img = UIImage(data: arrhinhanh[0].data as! Data)
            cell.ImageKV?.image = resizeImage(image: img!, targetSize: CGSize.init(width: 92, height: 92))
            
        }
        else{
            cell.ImageKV?.image = nil
        }
        
        cell.TenKV.text = ten
        cell.ThongTinKV.text = mota
        
        return cell
    }
 
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            DB.MOC.delete(ListKhuVuc[indexPath.row])
            
            ListKhuVuc.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            DB.save()
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let start = sourceIndexPath.row
        let end = destinationIndexPath.row
        if start < end{
            for var i in start..<end{
                KhuVuc.swap(source: i,end: i+1)
                i += 1;
            }
        }
        else if start > end{
            for var i in (end+1...start).reversed(){
                KhuVuc.swap(source: i,end: i-1)
                i -= 1;
            }
        }
        let movedObject = ListKhuVuc[sourceIndexPath.row]
        ListKhuVuc.remove(at: sourceIndexPath.row)
        ListKhuVuc.insert(movedObject, at: destinationIndexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "capnhat" ,
            let nextScene = segue.destination as? ViewControllerThemKhuVuc ,
            let indexPath = self.tableView.indexPathForSelectedRow {
            
            nextScene.Khuvuc = ListKhuVuc[indexPath.row]
            nextScene.delegate = self
        }
        if segue.identifier == "themmoi" {
            let nextScene = segue.destination as? ViewControllerThemKhuVuc
            nextScene?.Khuvuc = nil
            nextScene?.delegate = self
        }
        
    }
    func UpdateInformation() {
        ListKhuVuc = KhuVuc.all() as! [KhuVuc]
        self.tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
