//
//  BaseView.swift
//  SampleTv
//
//  Created by @karthi on 20/03/23.
//

import UIKit

class BaseView: UIView {
    
    fileprivate var baseVC : BaseViewController?
    
    @IBOutlet weak var backBtn : UIButton?
    
    @IBAction
    func backAction(_ sender : UIButton){
        self.baseVC?.exitScreen(animated: true)
    }
    
    
    func didLoad(baseVC : BaseViewController){
        print("Base View Did Load")
    }
    
    func darkModeChange(){
        print("Dark Mode Change")
    }
    
    func willAppear(baseVC : BaseViewController){
        print("Base View Will Appear")
    }
    
    func didAppear(baseVC : BaseViewController){
        print("Base View Did Appear")
    }
    
    func willDisappear(baseVC : BaseViewController){
        print("Base View Will DisAppear")
    }
    
    func didDisappear(baseVC : BaseViewController){
        print("Base View Did DisAppear")
    }
    
    func didLayoutSubviews(baseVC: BaseViewController){
        print("Base View Did Layout SubViews")
    }
}


