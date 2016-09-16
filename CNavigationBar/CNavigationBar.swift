//
//  CNavigationBar.swift
//  CNavigationBar
//
//  Created by Victor on 7/29/16.
//  Copyright © 2016 Victor Sigler. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    fileprivate struct AssociatedKeys {
        static var OverlayKey = "nsh_OverlayKey"
    }
    
    var overlay: UIView? {
        
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.OverlayKey) as? UIView
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(
                    self,
                    &AssociatedKeys.OverlayKey,
                    newValue as UIView?,
                    .OBJC_ASSOCIATION_RETAIN_NONATOMIC
                )
            }
        }
    }
    
    func _setBackgroundColor(_ color: UIColor) {
        
        if self.overlay == nil {
            self.setBackgroundImage(UIImage(), for: .default)
            self.overlay = UIView(frame: CGRect(x: 0, y: -20, width: self.bounds.width, height: self.bounds.height + 20 ))
            self.overlay?.isUserInteractionEnabled = false
            self.overlay?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.insertSubview(self.overlay!, at: 0)
        }
        
        self.overlay?.backgroundColor = color
    }
    
    func setTranslationY(_ translation: CGFloat) {
        self.transform  = CGAffineTransform(translationX: 0, y: translation)
    }
    
    func setAlphaElements(_ alpha: CGFloat) {
        
        guard let leftElements = self.value(forKey: "_leftViews") as? Array<UIView> else { return }
        
        for element in leftElements {
            element.alpha = alpha
        }
        
        guard let rightElements = self.value(forKey: "_rightViews") as? Array<UIView> else { return }
        
        for element in rightElements {
            element.alpha = alpha
        }
        
        guard let titleView = self.value(forKey: "_titleView") as? UIView else { return }
        titleView.alpha = alpha
        
        for obj in self.subviews {
            if obj.isKind(of: NSClassFromString("UINavigationItemView")!) {
                obj.alpha = alpha
                break
            }
        }
    }
    
    func reset() {
        self.setBackgroundImage(nil, for: .default)
        self.overlay?.removeFromSuperview()
        self.overlay = nil
    }
}
