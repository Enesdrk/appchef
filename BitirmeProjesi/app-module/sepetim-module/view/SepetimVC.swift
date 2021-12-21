//
//  SepetimVC.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 6.12.2021.
//

import UIKit

class SepetimVC: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    
    @IBOutlet weak var sepetViewAlt: UIView!
    
    @IBOutlet weak var lblTutar: UILabel!
    var sepetimyemek = [Sepet_Yemekler]()
    
    
    var sepetimPresenterNesnesi : ViewtoPresenterSepetimProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        Sepetimrouter.createModule(ref: self)
        // tasarım
        sepetViewAlt.layer.cornerRadius = 20.0
        sepetViewAlt.layer.masksToBounds = false
        sepetViewAlt.layer.shadowColor = UIColor.black.cgColor
        sepetViewAlt.layer.shadowOpacity = 0.3
        sepetViewAlt.layer.shadowOffset = .zero
        
        sepetViewAlt.layer.shouldRasterize = true
        
        itemCount()


    }
    
    
    @IBAction func btnSepetiOnayla(_ sender: Any) {
        
            for sepet in sepetimyemek {
                self.sepetimPresenterNesnesi?.sil(yemek_sepet_id: Int(sepet.sepet_yemek_id!)!, kullanici_adi: "enesdirik")
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetimPresenterNesnesi?.listele(kullanici_adi:"enesdirik")
        sepetiTopla()
        itemCount()
    }
    func itemCount (){
        var count = 0
        for sepetimyemek in sepetimyemek {
            count += 1
        }
        if let tabsItem = tabBarController?.tabBar.items{
            let item = tabsItem[2]
            item.badgeValue = " \(count)"
        }
        
    }
    func sepetiTopla(){
        var toplam = 0
        var fiyat = 0
        
        for yemek in sepetimyemek {
            fiyat = Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!
            toplam  += fiyat
        }
        lblTutar.text = "\(toplam)"
    }
}
extension SepetimVC : PresenterToViewSepetimProtocol {
    func vieweVeriGonder(sepetListesi: Array<Sepet_Yemekler>) {
        self.sepetimyemek = sepetListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
            self.sepetiTopla()
        }
    }
}
extension SepetimVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetimyemek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepetimyemek[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetimTableViewCell
        
        // Hücre Bilgileri
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)"){
            DispatchQueue.main.async {hucre.imgyemek.kf.setImage(with: url)}}
        
            hucre.lblYemekAdi.text = sepet.yemek_adi
            hucre.lblAdet.text = "Adet : \(sepet.yemek_siparis_adet!)"
        
        
        
        // Toplam Fiyat Ürün başına
        let sepetfiyat = Int(sepet.yemek_fiyat!)!
             let sepetAdet = Int(sepet.yemek_siparis_adet!)!
             let total = sepetfiyat * sepetAdet
             hucre.lblYemekFiyat.text = "\(total)"
        
            return hucre
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            (contextualAction,view,bool) in
            let yemek = self.sepetimyemek[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetimPresenterNesnesi?.sil(yemek_sepet_id: Int(yemek.sepet_yemek_id!)!, kullanici_adi: "enesdirik")
            }
            alert.addAction(evetAction)
            self.present(alert,animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
