//
//  YemekDetayRouter.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 7.12.2021.
//

import Foundation

class YemekDetayRouter : PresenterToRouterYemekDetayProtocol {
    static func createModule(ref: YemekDetayVC) {
        ref.yemekDetayPresenterNesnesi = YemekDetayPresenter()
        ref.yemekDetayPresenterNesnesi?.yemekDetayInteractor = YemekDetayInteractor()
    }
}
