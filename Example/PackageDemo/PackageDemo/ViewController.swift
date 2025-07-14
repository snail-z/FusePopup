//
//  ViewController.swift
//  PackageDemo
//
//  Created by zhanghao on 2025/7/10.
//

import UIKit
import FusePopup
import SnapKit

class ViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Popup", for: .normal)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(popupAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(200)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
    }
    
    lazy var exampleView: ExampleView1 = {
        let exampleView = ExampleView1()
        exampleView.backgroundColor = .orange
        return exampleView
    }()
}

extension ViewController {
    
    @objc func popupAction() {
        var config = PopupConfiguration()
        config.coverStyle = .color(.black.withAlphaComponent(0.7))
        config.placement = .center
        config.dismissOnMaskTap = true
//        config.animationType = .selectBy(enter: .slide(.top), exit: .slide(.bottom))
        config.animator = PopupSlideAnimator(
            enter: .init(duration: 0.75, useSpringAnimation: true),
            exit: .init(),
            directions: .init(enter: .top, exit: .bottom)
        )
        PopupPresenter.show(exampleView, in: self.view, config: config)
    }
}
