//
//  AnasayfaPresenter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 7.12.2021.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol?
    var anasayfaView : PresenterToViewAnasayfaProtocol?
    
    func yemekYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
