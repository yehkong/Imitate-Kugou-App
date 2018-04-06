//
//  BaceViewController.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/5.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit


//点击听唱看传值协议
protocol MainNavigationDelegate {
    func changToModel(_ model : ActionModel)
}

class BaceViewController: UIViewController {
    
    var titleBgView : UIView?
    
    var mainDelegate : MainNavigationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        // Do any additional setup after loading the view.
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "list"), style: .plain, target: self, action: #selector(showAccountPage(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(searchAction(_:)))
        
        //听唱看视图初始化
        titleBgView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 180, height: 35))
        let titleArr = ["听","看","唱"]
        for i in 0..<3 {
            let btn = UIButton.init(frame: CGRect.init(x: i * 60, y: 0, width: 60, height: 35))
            btn.tag = i
            btn.setTitle(titleArr[i], for: .normal)
            btn.setTitleColor(UIColor.lightGray, for: .normal)
            btn.setTitleColor(UIColor.white, for: .selected)
            
            btn.addTarget(self, action: #selector(changeAction(_:)), for: UIControlEvents.touchUpInside)
            titleBgView?.addSubview(btn)
        }
        navigationItem.titleView = titleBgView
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(retractAccountPage(_:)))
        self.view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func retractAccountPage(_ tap: UIGestureRecognizer) {
        if isShowAccountPage {
            if mainDelegate != nil{
                mainDelegate?.changToModel(.DismissAccountModel)
            }
        }else{
            return
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// 展开account页面事件
    ///
    /// - Parameter sender:
    @objc func showAccountPage(_ sender : UIBarButtonItem )
    {
        if mainDelegate != nil{
            if isShowAccountPage {
                
                mainDelegate?.changToModel(.DismissAccountModel)
                
            }else{
                mainDelegate?.changToModel(.ShowAccountModel)
            }
        }
        
        
    }
    
    /// 搜索事件
    ///
    /// - Parameter sender:
    @objc func searchAction(_ sender : UIBarButtonItem) -> () {
        
    }
    
    /// 点击听看唱按钮事件
    ///
    /// - Parameter btn:
    @objc func changeAction(_ btn : UIButton)
    {
        updateBtnsStatus(btn)
        switch btn.tag {
        case 0:
            if mainDelegate != nil{
                mainDelegate?.changToModel(.ListenModel)
            }
        case 1:
            if mainDelegate != nil{
                mainDelegate?.changToModel(.LookModel)
            }
        default:
            if mainDelegate != nil{
                mainDelegate?.changToModel(.SingModel)
            }
        }
        
    }
    
    func updateBtnsStatus(_ sender : UIButton) {
        let btnArr : [UIView]  = (titleBgView?.subviews)!
        for item in btnArr {
            let btn = item as! UIButton
            if btn === sender {
                btn.isSelected = true
            }else{
                btn.isSelected = false
            }
            
        }
        
    }
    
}
