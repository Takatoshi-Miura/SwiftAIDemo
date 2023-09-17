//
//  TabBarPage.swift
//  SwiftAIDemo
//
//  Created by Takatoshi Miura on 2023/09/17.
//

import UIKit

enum TabBarPage {
    
    case util
    case dataSource

    init?(index: Int) {
        switch index {
        case 0:
            self = .util
        case 1:
            self = .dataSource
        default:
            return nil
        }
    }
    
    /// タイトルを返却
    /// - Returns: タイトル文字列
    func pageTitleValue() -> String {
        switch self {
        case .util:
            return "ツール"
        case .dataSource:
            return "データ"
        }
    }
    
    /// 並び順を返却
    /// - Returns: 並び順
    func pageOrderNumber() -> Int {
        switch self {
        case .util:
            return 0
        case .dataSource:
            return 1
        }
    }
    
    /// タブのアイコン画像を返却
    /// - Returns: アイコン画像
    func pageTabIcon() -> UIImage {
        switch self {
        case .util:
            return UIImage(systemName: "list.bullet.indent")!
        case .dataSource:
            return UIImage(systemName: "book")!
        }
    }
    
}
