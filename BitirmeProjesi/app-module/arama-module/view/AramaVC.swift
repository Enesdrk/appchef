//
//  AramaVC.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import UIKit
import CoreMIDI
import SwiftUI

class AramaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var aramaTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    var aramaPresenterNesnesi:ViewToPresenterAramaProtocol?

    var filteredYemeklerListe = [Yemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        aramaTableView.dataSource = self
        aramaTableView.delegate = self

        

        Aramarouter.createModule(ref: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        aramaPresenterNesnesi?.aramaInteractor?.yemekleriListele()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aramaToDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
    }
}
extension AramaVC : PresenterToViewAramaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        self.filteredYemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.aramaTableView.reloadData()
        }
    }
}
extension AramaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      
        self.filteredYemeklerListe = self.yemeklerListe.filter { yemek in
            if yemek.yemek_adi!.lowercased().contains(searchText.lowercased())
            {
                return true
            }
            if searchText == ""{
                return true
            }
            return false
        }
        self.aramaTableView.reloadData()
    }
}

extension AramaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredYemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = filteredYemeklerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "aramaListesiHucre",for: indexPath) as! AramaTableViewHucre
    
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"){
            DispatchQueue.main.async {
                hucre.imgYemek.kf.setImage(with: url)
            }
        }
        hucre.lblYemekAdi.text = "\(yemek.yemek_adi!)"
        hucre.lblYemekFiyat.text = yemek.yemek_fiyat
        return hucre
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = filteredYemeklerListe[indexPath.row]
        performSegue(withIdentifier: "aramaToDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
