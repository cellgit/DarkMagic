//
//  PanGestureViewProtocol.swift
//  DarkMagic_Example
//
//  Created by liuhongli on 2023/2/10.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol PanGestureViewProtocol {
    associatedtype View: UIView
    /// 滑动的view
    var targetView: View { get }
    /// view高度
    var targetViewHeight: CGFloat { get }
    /// view显示的高度,小于此高度,view会自动收起
    var autoDismissHeight: CGFloat? { get }
    /// 动画时间
    var duration: CGFloat? { get }
    /// targetView 动画完成后调用
    func downAnimationCompleted()
}

extension PanGestureViewProtocol {
    public func panGestureAction(pan: UIPanGestureRecognizer) {
        let translation = pan.translation(in: self.targetView)
        let height = targetViewHeight - translation.y
        if translation.y < 0 {
            return
        } else {
            let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
            let SCREEN_WIDTH = UIScreen.main.bounds.size.width
            self.targetView.frame = CGRect(x: 0, y: SCREEN_HEIGHT-height, width: SCREEN_WIDTH, height: targetViewHeight)
            switch pan.state {
            case .began:
                break
            case .ended:
                if height < autoDismissHeight ?? targetViewHeight*0.5, height > 0 {
                    moveToDown(targetView)
                } else if height >= autoDismissHeight ?? targetViewHeight*0.5, height <= targetViewHeight {
                    moveToUp(targetView)
                } else if height <= 0 {
                    targetView.frame = CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: targetViewHeight)
                } else {
                    targetView.frame = CGRect(x: 0, y: SCREEN_HEIGHT-targetViewHeight, width: SCREEN_WIDTH, height: targetViewHeight)
                }
            default:
                break
            }
        }
    }
    private func moveToUp(_ targetView: View) {
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: duration ?? 0.2, delay: 0, options: .curveLinear) {
            targetView.frame = CGRect(x: 0, y: SCREEN_HEIGHT - targetViewHeight, width: SCREEN_WIDTH, height: targetViewHeight)
        } completion: { _ in }
    }
    private func moveToDown(_ targetView: View) {
        let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
        let SCREEN_WIDTH = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: duration ?? 0.2, delay: 0, options: .curveLinear) {
            targetView.frame = CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: targetViewHeight)
        } completion: { finished in
            if finished {
                downAnimationCompleted()
            } else { }
        }
    }
}


