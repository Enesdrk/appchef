//
//  AramaRouter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 10.12.2021.
//

import Foundation

class Aramarouter : PresenterToRouterAramaProtocol {
    static func createModule(ref: AramaVC) {
        let presenter : ViewToPresenterAramaProtocol & InteractorToPresenterAramaProtocol = AramaPresenter()
        
        
        ref.aramaPresenterNesnesi = presenter
        
        ref.aramaPresenterNesnesi?.aramaInteractor = AramaInteractor()
        
        ref.aramaPresenterNesnesi?.aramaView = ref
        
        ref.aramaPresenterNesnesi?.aramaInteractor?.aramaPresenter = presenter
        
    }
}
