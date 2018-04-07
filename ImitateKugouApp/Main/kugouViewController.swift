//
//  kugouViewController.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/5.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit

class kugouViewController: BaceViewController {
    
    var mainScrollView : UIScrollView?
    
    lazy  var listenController : ListenViewController = {
        let listen = ListenViewController()
        return listen
    }()
    
    lazy  var lookController : LookViewController = {
        let look = LookViewController()
        return look
    }()
    
    lazy  var singController : SingViewController = {
        let sing = SingViewController()
        return sing
    }()
    
    lazy var sharePlayer = PlayerViewController.SharePlayer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let kheight = self.view.bounds.size.height - 60
        mainScrollView = UIScrollView.init()
        mainScrollView?.frame = CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: kheight)
        mainScrollView?.delegate = self
        mainScrollView?.bounces = false
        mainScrollView?.isPagingEnabled = true
        view.addSubview(mainScrollView!)
        // Do any additional setup after loading the view.
        
        listenController.view.frame = CGRect.init(x: 0, y: 0, width: ScreenW, height: kheight)
        mainScrollView?.addSubview(listenController.view)
        
        lookController.view.frame = CGRect.init(x: ScreenW, y: 0, width: ScreenW, height: kheight)
        mainScrollView?.addSubview(lookController.view)
        
        singController.view.frame = CGRect.init(x: 2 * ScreenW, y: 0, width: ScreenW, height: kheight)
        mainScrollView?.addSubview(singController.view)
        
        mainScrollView?.contentSize = CGSize.init(width: 3 * ScreenW, height: kheight)
        
        sharePlayer.view.frame = CGRect.init(x: 0, y: ScreenH - 60, width: ScreenW, height: 60)
        self.addChildViewController(sharePlayer)
        self.view.addSubview(sharePlayer.view)
    }
    
    override func changeAction(_ btn: UIButton) {
        UIView.animate(withDuration: 0.35, animations: {
            self.updateBtnsStatus(btn)
            switch btn.tag {
            case 0:
                self.mainScrollView?.contentOffset = CGPoint.init(x: 0, y: 0)
                self.underline?.transform = CGAffineTransform.identity
            case 1:
                self.mainScrollView?.contentOffset = CGPoint.init(x: ScreenW, y: 0)
                self.underline?.transform = CGAffineTransform.init(translationX: 60, y: 0)
                
            default:
                self.mainScrollView?.contentOffset = CGPoint.init(x: 2*ScreenW, y: 0)
                self.underline?.transform = CGAffineTransform.init(translationX: 120, y: 0)
            }
        }, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension kugouViewController: UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let off_x = scrollView.contentOffset.x
        let btn = UIButton.init()
        if off_x < ScreenW / 2 {
            scrollView.contentOffset = CGPoint.zero
            btn.tag = 0
        }else if ScreenW / 2 <= off_x && off_x < 3 * ScreenW / 2 {
            scrollView.contentOffset = CGPoint.init(x: ScreenW, y:0 )
            btn.tag = 1
        }else{
            scrollView.contentOffset = CGPoint.init(x: 2 * ScreenW, y: 0)
            btn.tag = 2
        }
        changeAction(btn)
    }
    
}


