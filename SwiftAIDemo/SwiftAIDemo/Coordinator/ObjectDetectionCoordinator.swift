//
//  ObjectDetectionCoordinator.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

class ObjectDetectionCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func startFlow(in window: UIWindow?) {
    }
    
    func startFlow(in navigationController: UINavigationController) {
        self.navigationController = navigationController
        let objectDetectionViewController = ObjectDetectionViewController()
//        dataSourceViewController.delegate = self
        navigationController.pushViewController(objectDetectionViewController, animated: true)
    }
    
    func startFlow(in viewController: UIViewController) {
    }
    
}
