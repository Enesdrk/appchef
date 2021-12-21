//
//  SepetimTableViewCell.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 11.12.2021.
//

import UIKit

class SepetimTableViewCell: UITableViewCell{

    @IBOutlet weak var imgyemek: UIImageView!
    @IBOutlet weak var lblYemekAdi: UILabel!
    @IBOutlet weak var lblYemekFiyat: UILabel!
    
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var lblAdet: UILabel!
    
    
    
    var sepet_yemekler = [Sepet_Yemekler]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code




        hucreArkaPlan.layer.cornerRadius = 6.0
        hucreArkaPlan.layer.masksToBounds = false
        hucreArkaPlan.layer.shadowColor = UIColor.black.cgColor
        hucreArkaPlan.layer.shadowOpacity = 0.2
        hucreArkaPlan.layer.shadowOffset = .zero
        hucreArkaPlan.layer.shadowPath = UIBezierPath(rect: hucreArkaPlan.bounds).cgPath
        hucreArkaPlan.layer.shouldRasterize = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

