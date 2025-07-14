//
//  ExampleView1.swift
//  PackageDemo
//
//  Created by zhanghao on 2025/7/14.
//

import UIKit
import FusePopup

class ExampleView1: UIView {}

extension ExampleView1: PopupPresentable {
    
    func preferredPopupSize(in container: UIView) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}
