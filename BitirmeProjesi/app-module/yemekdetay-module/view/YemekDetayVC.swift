//
//  YemekDetayVC.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 6.12.2021.
//

import UIKit
import Kingfisher
import Alamofire

class YemekDetayVC: UIViewController {

    @IBOutlet weak var imgYemek: UIImageView!
    @IBOutlet weak var lblYemekAdi: UILabel!
    @IBOutlet weak var lblAdet: UILabel!
    @IBOutlet weak var lblFiyat: UILabel!
    @IBOutlet weak var lblBilgi: UILabel!
    @IBOutlet weak var stepperDurum: UIStepper!
    @IBOutlet weak var arkaPlan: UIView!
    @IBOutlet weak var imgArkaPlan: UIView!
    
    
    var yemek : Yemekler?
    var sepet_yemekler :Sepet_Yemekler?
    
    var yemekDetayPresenterNesnesi: ViewToPresenterYemekDetayProtocol?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        lblAdet.isHidden = false
        lblAdet.text = "1"
        if let y = yemek {
            lblBilgi.isHidden = true
            lblYemekAdi.text = y.yemek_adi
            lblFiyat.text = "\(y.yemek_fiyat!)"
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.imgYemek.kf.setImage(with: url)
                    
                    
            // Tasarım
           //         self.imgArkaPlan.backgroundColor = UIColor(white: 0.97, alpha: 1)
 
                    self.imgArkaPlan.layer.cornerRadius = 15.0
                    self.imgArkaPlan.layer.masksToBounds = false
                    self.imgArkaPlan.layer.shadowColor = UIColor.black.cgColor
                    self.imgArkaPlan.layer.shadowOpacity = 0.2
                    self.imgArkaPlan.layer.shadowOffset = .zero

                    self.imgArkaPlan.layer.shouldRasterize = true
                    

                }
            }

        }
        YemekDetayRouter.createModule(ref: self)
    }
    
    @IBAction func btnSepeteEkle(_ sender: Any) {
        
        if let ymkAdi = lblYemekAdi.text , let yResimAdi = yemek?.yemek_resim_adi, let yFiyat = lblFiyat.text, let adetdeger = lblAdet.text, let y = yemek
        {
            yemekDetayPresenterNesnesi?.ekle(yemek_adi: ymkAdi, yemek_resim_adi: yResimAdi, yemek_fiyat: Int(y.yemek_fiyat!)!, yemek_siparis_adet: Int(adetdeger)!, kullanici_adi: "enesdirik")
        }
        lblBilgi.isHidden = false
    }
    
    @IBAction func btnStepper(_ sender: UIStepper) {
        lblAdet.isHidden = false
        lblAdet.text = "\(Int(sender.value))"
    }

}
