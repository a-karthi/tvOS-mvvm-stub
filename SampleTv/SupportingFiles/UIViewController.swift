//
//  UIViewController.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation
import UIKit

extension UIViewController {
    func isPresented() -> Bool {
        if self.presentingViewController != nil {
            return true
        } else if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController  {
            return true
        } else if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        return false
    }
}

