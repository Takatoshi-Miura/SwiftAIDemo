//
//  MainCoordinator.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func startFlow(in window: UIWindow?) {
    }
    
    func startFlow(in navigationController: UINavigationController) {
        self.navigationController = navigationController
        let mainViewController = MainViewController()
        mainViewController.delegate = self
        navigationController.pushViewController(mainViewController, animated: true)
    }
    
    func startFlow(in viewController: UIViewController) {
    }
    
}

extension MainCoordinator: MainViewControllerDelegate {
    
    // 物体検出
    func mainVCObjectDetectionDidTap(_ viewController: UIViewController) {
        
    }
    
}
