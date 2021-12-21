//
//  TableViewAnaSayfaHucre.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 6.12.2021.
//

import UIKit

class TableViewAnaSayfaHucre: UITableViewCell {
    
    @IBOutlet weak var imgUrunResmi: UIImageView!
    @IBOutlet weak var lblUrunAdi: UILabel!
    @IBOutlet weak var lblUrunFiyat: UILabel!
    
    @IBOutlet weak var resimArkaPlan: UIView!
    @IBOutlet weak var hucreArkaPlan: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        //hucreArkaPlan.layer.borderWidth = 0.5
        hucreArkaPlan.layer.cornerRadius = 6.0
        hucreArkaPlan.layer.masksToBounds = false
        hucreArkaPlan.layer.shadowColor = UIColor.black.cgColor
        hucreArkaPlan.layer.shadowOpacity = 0.2
        hucreArkaPlan.layer.shadowOffset = .zero
        hucreArkaPlan.layer.shadowPath = UIBezierPath(rect: hucreArkaPlan.bounds).cgPath
        hucreArkaPlan.layer.shouldRasterize = true
        
        
        contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        resimArkaPlan.layer.cornerRadius = 6.0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    

}
