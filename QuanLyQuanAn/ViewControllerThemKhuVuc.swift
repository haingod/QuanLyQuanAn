//
//  tmpViewController.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/15/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import UIKit
protocol DataEnteredDelegate: class {
    func UpdateInformation()
}
class ViewControllerThemKhuVuc: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate{

    weak var delegate: DataEnteredDelegate? = nil
    @IBOutlet weak var txtKhuVuc: UITextField!
    
    @IBOutlet weak var txtMota: UITextView!
    @IBOutlet weak var MyCollection: UICollectionView!
    
    var Khuvuc:KhuVuc? = nil
    var ListHinhAnh:[HinhAnh] = []
    var imagePicker = UIImagePickerController()

    
    
    @IBAction func btnOK(_ sender: Any) {
        
        Khuvuc?.ten = txtKhuVuc.text
        Khuvuc?.mota = txtMota.text
      
        DB.save()
        delegate?.UpdateInformation()
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func CapNhatHinhAnh(_ sender: Any) {
        present(imagePicker, animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if Khuvuc == nil {
            Khuvuc = KhuVuc.create() as! KhuVuc
        }
        txtKhuVuc.text = Khuvuc?.ten
        txtMota.text = Khuvuc?.mota
        ListHinhAnh = Khuvuc?.hinhanhs?.array as! [HinhAnh]
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: *** ImagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let image = HinhAnh.create() as! HinhAnh
            image.data = UIImageJPEGRepresentation(pickedImage,1.0) as NSData?
            Khuvuc?.addToHinhanhs(image)
            ListHinhAnh = Khuvuc?.hinhanhs?.array as! [HinhAnh]
            MyCollection.reloadData()
            
        }
        dismiss(animated: true)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListHinhAnh.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellKhuvuc", for: indexPath as IndexPath) as! CVCellKhuVuc
        
        cell.ImageKhuvuc.image = UIImage(data: ListHinhAnh[indexPath.item].data as! Data)
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        Khuvuc?.removeFromHinhanhs(at: indexPath.item)
        DB.MOC.delete(ListHinhAnh[indexPath.item])
        ListHinhAnh.remove(at: indexPath.item)
        MyCollection.reloadData()
    }



}
