//
//  SepetimProtocols.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 11.12.2021.
//

import Foundation
protocol ViewtoPresenterSepetimProtocol {
    
    var sepetimInteractor:PresentertoInteractorSepetimProtocol? {get set}
    var sepetimView:PresenterToViewSepetimProtocol? {get set}
        
    func listele(kullanici_adi:String)
    func sil(yemek_sepet_id:Int,kullanici_adi:String)
    
}
protocol PresentertoInteractorSepetimProtocol{
    
    var sepetimPresenter:InteractorToPresenterSepetimProtocol?{get set}
    
    func sepetiListele(kullanici_adi:String)
    func urunSil(yemek_sepet_id:Int,kullanici_adi:String)
}

protocol InteractorToPresenterSepetimProtocol{
    
    func presenteraVeriGonder(sepetListesi:Array<Sepet_Yemekler>)
}

protocol PresenterToViewSepetimProtocol{
    
    func vieweVeriGonder(sepetListesi:Array<Sepet_Yemekler>)
}

protocol PresenterToRouterSepetimProtocol{
    
    static func createModule(ref:SepetimVC)
}
