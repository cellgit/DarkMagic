//
//  PanGestureViewController.swift
//  DarkMagic_Example
//
//  Created by liuhongli on 2023/2/11.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit

class PanGestureViewController: UIViewController {
    struct Layout {
        static let containerViewHeight: CGFloat = 500
    }
    lazy var containerView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .lightGray
        return view
    }()
    lazy var button: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 44/2
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initialUI()
        makePanGesture()
    }
    func initialUI() {
        view.addSubview(button)
        let width: CGFloat = 100
        let height: CGFloat = 44
        button.frame = CGRect(x: view.center.x - width/2, y: view.center.y - height/2, width: width, height: height)
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        view.addSubview(containerView)
        containerView.frame = CGRect(x: 0,
                                     y: UIScreen.main.bounds.size.height,
                                     width: UIScreen.main.bounds.size.width,
                                     height: Layout.containerViewHeight)
    }
    @objc
    func buttonAction(sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear) {
            self.containerView.frame = CGRect(x: 0,
                                              y: UIScreen.main.bounds.size.height - Layout.containerViewHeight,
                                              width: UIScreen.main.bounds.size.width,
                                              height: Layout.containerViewHeight)
        } completion: { _ in }
    }
}

extension PanGestureViewController: PanGestureViewProtocol {
    var targetView: UIView? {
        self.containerView
    }
    var targetViewHeight: CGFloat {
        Layout.containerViewHeight
    }
    var autoDismissHeight: CGFloat? {
        500
    }
    var duration: CGFloat? {
        0.2
    }
    func downAnimationCompleted() {
        debugPrint("downAnimationCompleted")
    }
    typealias View = UIView
    func makePanGesture() {
        let panGes = UIPanGestureRecognizer.init()
        containerView.addGestureRecognizer(panGes)
        panGes.addTarget(self, action: #selector(handlerPanGesture(sender:)))
    }
    @objc func handlerPanGesture(sender: UIPanGestureRecognizer) {
        panGestureAction(pan: sender)
    }
}
