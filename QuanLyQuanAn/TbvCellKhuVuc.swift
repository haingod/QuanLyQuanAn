//
//  TbvCellKhuVuc.swift
//  QuanLyQuanAn
//
//  Created by hai on 4/15/17.
//  Copyright © 2017 ibanana. All rights reserved.
//

import UIKit

class TbvCellKhuVuc: UITableViewCell {

    
    @IBOutlet weak var ImageKV: UIImageView!
    
    @IBOutlet weak var TenKV: UILabel!
    
    @IBOutlet weak var ThongTinKV: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
