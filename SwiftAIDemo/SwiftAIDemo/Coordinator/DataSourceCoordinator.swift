//
//  DataSourceCoordinator.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

class DataSourceCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    func startFlow(in window: UIWindow?) {
    }
    
    func startFlow(in navigationController: UINavigationController) {
        self.navigationController = navigationController
        let dataSourceViewController = DataSourceViewController()
//        dataSourceViewController.delegate = self
        navigationController.pushViewController(dataSourceViewController, animated: true)
    }
    
    func startFlow(in viewController: UIViewController) {
    }
    
}
