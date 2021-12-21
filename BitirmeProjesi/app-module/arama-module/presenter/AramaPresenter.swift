//
//  AramaPresenter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import Foundation

class AramaPresenter : ViewToPresenterAramaProtocol {
    var aramaInteractor: PresenterToInteractorAramaProtocol?
    
    var aramaView: PresenterToViewAramaProtocol?
    
    func listele() {
        aramaInteractor?.yemekleriListele()
    }
}
extension AramaPresenter : InteractorToPresenterAramaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        aramaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
