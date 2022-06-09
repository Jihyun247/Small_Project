//
//  ViewPagerViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/21.
//

import UIKit

class ViewPagerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func viewPagerButtonTapped(_ sender: UIButton) {
        guard let customViewPagerVC = storyboard?.instantiateViewController(withIdentifier: "CustomViewPagerViewController") as? CustomViewPagerViewController else { return }
         
        navigationController?.pushViewController(customViewPagerVC, animated: true)
    }
}
