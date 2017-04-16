//
//  ViewControllerThongKeDoanhThu.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/16/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import UIKit

class ViewControllerThongKeDoanhThu: UIViewController {

    
    @IBOutlet weak var FromDate: UIDatePicker!
    
    
    @IBOutlet weak var ToDate: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TKDoanhThuSegue" {
            let nextScene = segue.destination as? ViewControllerThongKeDoanhThu2
            nextScene?.FromDate = FromDate.date
            nextScene?.ToDate = ToDate.date
            
        }
        
    }


}
