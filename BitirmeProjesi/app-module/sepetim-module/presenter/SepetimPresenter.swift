//
//  SepetimPresenter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 11.12.2021.
//

import Foundation

class SepetimPresenter : ViewtoPresenterSepetimProtocol {
    
    var sepetimInteractor: PresentertoInteractorSepetimProtocol?
    
    var sepetimView: PresenterToViewSepetimProtocol?
    
    func listele(kullanici_adi: String) {
        sepetimInteractor?.sepetiListele(kullanici_adi: kullanici_adi)

    }
    

    
    func sil(yemek_sepet_id: Int, kullanici_adi: String) {
        sepetimInteractor?.urunSil(yemek_sepet_id: yemek_sepet_id, kullanici_adi: kullanici_adi)
    }
}
extension SepetimPresenter : InteractorToPresenterSepetimProtocol {
    func presenteraVeriGonder(sepetListesi: Array<Sepet_Yemekler>) {
        sepetimView?.vieweVeriGonder(sepetListesi: sepetListesi)
    }
}
