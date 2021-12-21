//
//  AramaTableViewHucre.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import UIKit

class AramaTableViewHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var lblYemekFiyat: UILabel!
    @IBOutlet weak var lblYemekAdi: UILabel!
    @IBOutlet weak var imgArkaPlan: UIView!
    @IBOutlet weak var imgYemek: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()


        imgArkaPlan.layer.cornerRadius = 6.0
        
        hucreArkaPlan.layer.cornerRadius = 6.0

        hucreArkaPlan.layer.masksToBounds = false
        hucreArkaPlan.layer.shadowColor = UIColor.black.cgColor
        hucreArkaPlan.layer.shadowOpacity = 0.2
        hucreArkaPlan.layer.shadowOffset = .zero

        hucreArkaPlan.layer.shouldRasterize = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
