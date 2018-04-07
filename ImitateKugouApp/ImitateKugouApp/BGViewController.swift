//
//  BGViewController.swift
//  ImitateKugouApp
//
//  Created by Geson on 2018/3/15.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit

var isShowAccountPage = false

class BGViewController: UIViewController,MainNavigationDelegate {
    
    lazy var accountPage : LoginViewController = {
        return LoginViewController()
    }()
    
    lazy var mainController : MainNaviController = {
        let listenController = kugouViewController()
        listenController.mainDelegate = self
        let mainNaviController = MainNaviController.init(rootViewController: listenController)
        return mainNaviController
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.init(red: 19/255.0, green: 48/255.0, blue: 100/255.0, alpha: 1.0)

        self.view.addSubview(accountPage.view)
        self.view.addSubview(mainController.view)
        
        accountPage.view.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func changToModel(_ model: ActionModel) {
        switch model {
        case .ListenModel:
            return
        case .LookModel:
            return
        case .SingModel:
            return
        case .DismissAccountModel:
            dismissAccountPage()
        default:
            showAccountPage()
            
        }
    }
    
    /// 展示AccountPage
    func showAccountPage() {
        UIView.animate(withDuration: 0.5, animations: {
            self.mainController.view.center = CGPoint.init(x: 5 * ScreenW / 4, y: ScreenH / 2)
            self.mainController.view.transform = CGAffineTransform.init(scaleX: 0.8, y: 0.8)
            self.accountPage.view.transform = CGAffineTransform.identity
        }) { (finished) in
            if finished {
                isShowAccountPage = true
            }
        }
    }
    /// 消失AccountPage
    func dismissAccountPage() {
        UIView.animate(withDuration: 0.5, animations: {
            self.mainController.view.center = self.view.center
            self.mainController.view.transform = CGAffineTransform.identity
            self.accountPage.view.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
        }) { (finished) in
            if finished {
                isShowAccountPage = false
            }
        }
    }
    
    
}

