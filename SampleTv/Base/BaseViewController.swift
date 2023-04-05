//
//  BaseViewController.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import Foundation
import UIKit

/// Its the base view controller that inherits all view controller classes inside application and helps to acheive mvvm

class BaseViewController: UIViewController {
    
    fileprivate var _baseView : BaseView? {
        return self.view as? BaseView
    }
    
    fileprivate var onExit : (()->())? = nil
    
    var stopSwipeExitFromThisScreen : Bool? {
        return nil
    }
    //MARK:- life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self._baseView?.didLoad(baseVC: self)
        // Do any additional setup after loading the view.
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self._baseView?.darkModeChange()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._baseView?.willAppear(baseVC: self)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self._baseView?.didAppear(baseVC: self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self._baseView?.willDisappear(baseVC: self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self._baseView?.didDisappear(baseVC: self)
        
        if self.isMovingFromParent{
            self.willExitFromScreen()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self._baseView?.didLayoutSubviews(baseVC: self)
    }
    
    //MARK:- UDF
    func exitScreen(animated : Bool,_ completion : (()->())? = nil){
        self.onExit = completion
        if self.isPresented(){
            self.dismiss(animated: animated) {
                completion?()
            }
        }else{
            self.navigationController?.popViewController(animated: true)
            completion?()
        }
    }
    
    ///called when screen will pop back
    func willExitFromScreen(){
        
    }

}
