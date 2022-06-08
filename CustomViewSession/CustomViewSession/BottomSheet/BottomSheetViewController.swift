//
//  BottomSheetViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/20.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func bottomSheetButtonTapped(_ sender: UIButton) {
        
        guard let customBottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "CustomBottomSheetViewController") as? CustomBottomSheetViewController else { return }
        
        customBottomSheetVC.modalTransitionStyle = .crossDissolve
        customBottomSheetVC.modalPresentationStyle = .overFullScreen
        
        self.present(customBottomSheetVC, animated: true) {
            customBottomSheetVC.showBottomSheet()
        }
    }
}
