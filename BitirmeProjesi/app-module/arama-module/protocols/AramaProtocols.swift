//
//  AramaProtocols.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import Foundation

protocol ViewToPresenterAramaProtocol {
    var aramaInteractor:PresenterToInteractorAramaProtocol? {get set}
    var aramaView:PresenterToViewAramaProtocol? { get set }
    
    func listele()
}
protocol PresenterToInteractorAramaProtocol {
    var aramaPresenter:InteractorToPresenterAramaProtocol? {get set}
    
    func yemekleriListele()
}
protocol InteractorToPresenterAramaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Yemekler>)
}

protocol PresenterToViewAramaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Yemekler>)
}
protocol PresenterToRouterAramaProtocol {
    static func createModule(ref:AramaVC)
}
