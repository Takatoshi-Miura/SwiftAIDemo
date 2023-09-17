//
//  MainViewController.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    // 物体検出ボタンタップ時
    func mainVCObjectDetectionDidTap(_ viewController: UIViewController)
}

class MainViewController: UIViewController {
    
    // MARK: - UI,Variable
    
    var delegate: MainViewControllerDelegate?

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .red
    }

}
