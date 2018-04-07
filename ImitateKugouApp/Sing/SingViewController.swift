//
//  SingViewController.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/7.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit

class SingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red

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

extension ListenViewController : MainNavigationDelegate{
    func changToModel(_ model: ActionModel) {
        
    }
}
