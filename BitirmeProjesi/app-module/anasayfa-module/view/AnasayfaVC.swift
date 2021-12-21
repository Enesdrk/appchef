//
//  ViewController.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 6.12.2021.
//

import UIKit
import Kingfisher
import Alamofire

class AnasayfaVC: UIViewController {

    @IBOutlet weak var yemeklerTableView: UITableView! // TableView
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    var yemeklerListe = [Yemekler]()
    @IBOutlet weak var segControl: UISegmentedControl!

        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.init(named: "Font")

        // TableView
        yemeklerTableView.dataSource = self
        yemeklerTableView.delegate = self
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.yemekYukle()
        
    }
    
    @IBAction func segIndexChanged(_ sender: Any) {
            
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
    }
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}
extension AnasayfaVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemekListesiHucre", for: indexPath) as! TableViewAnaSayfaHucre

        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.imgUrunResmi.kf.setImage(with: url)}}

        
        hucre.lblUrunAdi.text = yemek.yemek_adi!
        hucre.lblUrunFiyat.text = "\(yemek.yemek_fiyat!)"

        
        return hucre
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
