//
//  Yemekler.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 6.12.2021.
//

import Foundation
class Yemekler : Codable {
    var yemek_id:String?
    var yemek_adi:String?
    var yemek_resim_adi:String?
    var yemek_fiyat:String?
    var yemek_kategori:String?
    init(){
        
    }

    init(yemek_id:String,yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:String,yemek_kategori:String){
        self.yemek_id = yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_kategori = yemek_kategori
    }
    
    
    
    
    
    
    
    
}
