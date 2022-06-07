//
//  CustomPopUpViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/20.
//

import UIKit

class CustomPopUpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 화면을 클릭했을 때 터치 이벤트가 발생하는데 그것을 객체로 관리
    // 어느 부분에서 어느 뷰에서 터치 이벤트가 발생했는지 해당 메서드로 확인 가능
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        // 터치한 객체가 여러개 있는 것 그 중 맨 처음
        if let touch = touches.first,
           touch.view == self.view {
            // 만약 터치한 뷰가 뷰컨트롤러의 view 라면
            dismiss(animated: true)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func okButtonTapped(_ sender: UIButton) {
        
    }
}
