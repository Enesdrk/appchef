//
//  AramaInteractor.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import Foundation
import Alamofire

class AramaInteractor : PresenterToInteractorAramaProtocol{
    var aramaPresenter: InteractorToPresenterAramaProtocol?
    var aramaVCPresenter: InteractorToPresenterAramaProtocol?
    
    func yemekleriListele() {
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(YemekCevap.self, from: data)
                    var liste = [Yemekler]()
                    if let gelenListe = cevap.yemekler {
                        liste = gelenListe
                    }
                    self.aramaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                    
                    }catch{print(error.localizedDescription)}
            }
        }
    }
}
