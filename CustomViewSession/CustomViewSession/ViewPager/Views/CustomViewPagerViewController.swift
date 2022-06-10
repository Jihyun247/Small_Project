//
//  CustomViewPagerViewController.swift
//  CustomViewSession
//
//  Created by 김지현 on 2022/06/21.
//

import UIKit

class CustomViewPagerViewController: UIViewController {
    
    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var barBackgroundView: UIView!
    @IBOutlet weak var barView: UIView!
    
    @IBOutlet weak var barLeading: NSLayoutConstraint!
    @IBOutlet weak var barWidth: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let contents: [UIViewController] = [
        FirstViewController(),
        SecondViewController(),
        ThirdViewController()
    ]
    
    private var currentIndex: Int = 0
    private var tappedButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupPageViewController()
    }
    
    private func setupUI() {
        barWidth.constant = view.bounds.width / CGFloat(tabStackView.arrangedSubviews.count)
    }
    
    private func setupPageViewController() {
        // 자식 뷰 컨트롤러 추가
        self.addChild(pageViewController)
        
        // 두 뷰의 frame 맞춰주기
        containerView.frame = pageViewController.view.frame
        self.containerView.addSubview(pageViewController.view)
        
        pageViewController.didMove(toParent: self)
        
        // 프로토콜 델리게이트
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let firstVC = contents.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
        for subView in pageViewController.view.subviews {
            if let scrollView = subView as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    @IBAction func tabButtonClicked(_ sender: UIButton) {
        
        guard let index = tabStackView.arrangedSubviews.firstIndex(where: { $0 == sender }),
              index != currentIndex else {
                  return
              }
        
        tappedButton = true
        
        UIView.animate(withDuration: 0.3) {
            self.barLeading.constant = CGFloat(index) * self.barView.frame.width
            self.barBackgroundView.layoutIfNeeded()
        }
        
        let content = contents[index]
        
        pageViewController.setViewControllers([content], direction: currentIndex < index ? .forward : .reverse, animated: true) { _ in
            self.currentIndex = index
            self.tappedButton = false
        }
    }
    
}

extension CustomViewPagerViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        // pageViewController의 viewcontrollers 에는 항상 하나의 뷰컨만 들어가있게 된다. 따라서 현재 뷰컨을 viewControllers?.first로 가져올 수 있는 것
        guard let viewController = pageViewController.viewControllers?.first,
              let index = contents.firstIndex(where: { $0 == viewController }) else { return }
        
        currentIndex = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // firstIndex : array, collection 메서드, 배열에서 of에 해당하는 요소 중 가장 첫번째로 만나는 인덱스를 반환
        guard let index = contents.firstIndex(of: viewController) else { return nil }
        let prevIndex = index - 1
        if prevIndex < 0 {
            return nil
        }
        return contents[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == contents.count {
            return nil
        }
        return contents[nextIndex]
    }
}

extension CustomViewPagerViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard !tappedButton else { return }
        
        let offsetX = scrollView.contentOffset.x
        let contentWidth = pageViewController.view.frame.width
        
        // 좌우로 얼마나 움직였는지 체크하기 위한 퍼센티지
        let percent = (offsetX - contentWidth) / contentWidth
        
        // 바의 위치
        let constant = barView.frame.width * (CGFloat(currentIndex) + percent)
        barView.frame.origin.x = constant
    }
}
