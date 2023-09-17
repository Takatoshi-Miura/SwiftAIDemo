//
//  Coordinator.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

protocol Coordinator: AnyObject {
    
    func startFlow(in window: UIWindow?)
    
    func startFlow(in navigationController: UINavigationController)
    
    func startFlow(in viewController: UIViewController)
    
}
