//
//  SepetimInteractor.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 11.12.2021.
//

import Foundation
import Alamofire
import SwiftUI

class SepetimInteractor : PresentertoInteractorSepetimProtocol {
    var sepetimPresenter: InteractorToPresenterSepetimProtocol?
    
    func sepetiListele(kullanici_adi: String) {
        let myURL = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php"
        let params:Parameters = ["kullanici_adi":kullanici_adi]
        
        Alamofire.request(myURL, method: .post, parameters: params)
            .responseJSON{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(Sepet_YemekCevap.self,from:data)
                    var liste = [Sepet_Yemekler]()
                    if let gelenListe = cevap.sepet_yemekler {
                        liste = gelenListe
                    }
                    self.sepetimPresenter?.presenteraVeriGonder(sepetListesi: liste)
                }catch{
                    print(error.localizedDescription)
                    self.sepetimPresenter?.presenteraVeriGonder(sepetListesi: [])
                }
            }
        }
    }
    
    func urunSil(yemek_sepet_id: Int, kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":yemek_sepet_id,"kullanici_adi":kullanici_adi]
        
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{ response in
            
            if let data = response.data {
                do{
                    if let json = try JSONSerialization
                        .jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                }
                catch{
                    print(error.localizedDescription)
                    
                }
                
                self.sepetiListele(kullanici_adi: kullanici_adi)
            }
        }
    }
}
