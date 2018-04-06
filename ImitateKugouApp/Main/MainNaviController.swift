//
//  MainNaviController.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/5.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit


class MainNaviController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor.init(red: 0, green: 133/255.0, blue: 1, alpha: 1)
        // Do any additional setup after loading the view.
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
