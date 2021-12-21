//
//  SepetimRouter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 11.12.2021.
//

import Foundation

class Sepetimrouter : PresenterToRouterSepetimProtocol {
    static func createModule(ref: SepetimVC) {
        let presenter : ViewtoPresenterSepetimProtocol & InteractorToPresenterSepetimProtocol = SepetimPresenter()
        
        ref.sepetimPresenterNesnesi = presenter
        
        ref.sepetimPresenterNesnesi?.sepetimInteractor = SepetimInteractor()
        ref.sepetimPresenterNesnesi?.sepetimView = ref
        
        ref.sepetimPresenterNesnesi?.sepetimInteractor?.sepetimPresenter = presenter
    }
}
