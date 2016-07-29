//
//  CNavigationBar.swift
//  CNavigationBar
//
//  Created by Victor on 7/29/16.
//  Copyright © 2016 Victor Sigler. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    private struct AssociatedKeys {
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
    
    func _setBackgroundColor(color: UIColor) {
        
        if self.overlay == nil {
            self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            self.overlay = UIView(frame: CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20 ))
            self.overlay?.userInteractionEnabled = false
            self.overlay?.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
            self.insertSubview(self.overlay!, atIndex: 0)
        }
        
        self.overlay?.backgroundColor = color
    }
    
    func setTranslationY(translation: CGFloat) {
        self.transform  = CGAffineTransformMakeTranslation(0, translation)
    }
    
    func setAlphaElements(alpha: CGFloat) {
        
        guard let leftElements = self.valueForKey("_leftViews") as? Array<UIView> else { return }
        
        for element in leftElements {
            element.alpha = alpha
        }
        
        guard let rightElements = self.valueForKey("_rightViews") as? Array<UIView> else { return }
        
        for element in rightElements {
            element.alpha = alpha
        }
        
        guard let titleView = self.valueForKey("_titleView") as? UIView else { return }
        titleView.alpha = alpha
        
        for obj in self.subviews {
            if obj.isKindOfClass(NSClassFromString("UINavigationItemView")!) {
                obj.alpha = alpha
                break
            }
        }
    }
    
    func reset() {
        self.setBackgroundImage(nil, forBarMetrics: .Default)
        self.overlay?.removeFromSuperview()
        self.overlay = nil
    }
}
