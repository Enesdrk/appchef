//
//  AnasayfaInteractor.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 7.12.2021.
//

import Foundation
import Alamofire
class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
 
    
    func tumYemekleriAl() {
        
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemekCevap.self, from: data)
                    var liste = [Yemekler]()
                    if let gelenListe = cevap.yemekler {
                        liste = gelenListe
                    }
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    
                    }catch{print(error.localizedDescription)}
            }
        }

    }
}

/*
 
 db.open()
 do {
     try self.db.executeUpdate("INSERT INTO yemekler (yemek_adi,yemek_resim_adi,yemek_fiyat) VALUES (?,?,?)", values: [])
 }catch {
     print(error.localizedDescription)
 }
 db.close()
 
 */
