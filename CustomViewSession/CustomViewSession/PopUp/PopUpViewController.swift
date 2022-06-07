//
//  PopUpViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/20.
//

import UIKit

class PopUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func popUpButtonTapped(_ sender: UIButton) {
        
        guard let CustomPopUpVC = storyboard?.instantiateViewController(withIdentifier: "CustomPopUpViewController") as? CustomPopUpViewController else { return }
        
        // 효과
        
        CustomPopUpVC.modalTransitionStyle = .crossDissolve
        // fullScreen VS overFullScreen
        CustomPopUpVC.modalPresentationStyle = .overFullScreen
        
        self.present(CustomPopUpVC, animated: true)
    }
}
