//
//  SonVC.swift
//  BitirmeProjesi
//
//  Created by Macintosh on 17.12.2021.
//

import UIKit
import SwiftUI

class SonVC: UIViewController {

    @IBOutlet weak var btnaliveriseDevamEt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnaliveriseDevamEt.layer.cornerRadius = 10.0
        btnaliveriseDevamEt.layer.masksToBounds = false
        btnaliveriseDevamEt.layer.shadowColor = UIColor.black.cgColor
        btnaliveriseDevamEt.layer.shadowOpacity = 0.2
        btnaliveriseDevamEt.layer.shadowOffset = .zero
        btnaliveriseDevamEt.layer.shadowPath = UIBezierPath(rect: btnaliveriseDevamEt.bounds).cgPath
        btnaliveriseDevamEt.layer.shouldRasterize = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnanasayfa(_ sender: Any) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tabBarID") as! UITabBarController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

}
