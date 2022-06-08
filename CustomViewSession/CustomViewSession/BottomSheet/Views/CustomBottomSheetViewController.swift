//
//  CustomBottomSheetViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/20.
//

import UIKit

class CustomBottomSheetViewController: UIViewController {
    
    @IBOutlet weak var bottomSheetHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomSheetHeight.constant = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.hideBottomSheet()
    }
}

extension CustomBottomSheetViewController {
    
    func showBottomSheet() {
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetHeight.constant = 448
            // layoutIfNeeded -> 지금 바로 뷰의 업데이트 사항을 렌더링 하겠다는 의미
            self.view.layoutIfNeeded()
        }
    }
    
    func hideBottomSheet() {
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetHeight.constant = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
            self.dismiss(animated: true)
        }
    }
}
