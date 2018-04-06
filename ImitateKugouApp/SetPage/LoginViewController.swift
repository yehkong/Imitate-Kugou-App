//
//  LoginViewController.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/4.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var tableView : UITableView?
    //视图上部控件
    lazy var headerView : UIView = {
        let headerBgView = UIView.init(frame: CGRect(x: 0, y: 50, width:ScreenW , height:ScreenH ))
        let accountHeader : UIImageView = UIImageView.init(frame: CGRect.init(x: 30, y: 8, width: 44, height: 44))
        accountHeader.image = UIImage.init(named: "login")
        headerBgView.addSubview(accountHeader)
        let loginBtn = UIButton.init(type: .custom)
        loginBtn.frame = CGRect.init(x: 100, y: 0, width: 100, height: 60)
        loginBtn.setTitle("登录/注册", for: UIControlState.normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        headerBgView.addSubview(loginBtn)
        return headerBgView
    }()
    //视图下部控件
    lazy var footView : UIView = {
        let y_max = tableView?.frame.maxY
        let footBgView = UIView.init(frame: CGRect.init(x: 0, y: y_max! + 10, width: ScreenW, height: 50))
        let setBtn = UIButton.init()
        setBtn.frame = CGRect.init(x: 30, y: 0, width: 80, height: 50)
        setBtn.setImage(UIImage.init(named: "setting"), for: .normal)
        setBtn.setTitle("设置", for: UIControlState.normal)
        setBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        footBgView.addSubview(setBtn)
        return footBgView
    }()
    
    //tableViewcell图片
    lazy var imageArr : Array = ["message","skin","vip","flow","clock","sound","tool","clockRing","cloud","wifi","statusBar"]
    //tableViewcell标题
    lazy var titleArr : Array = ["消息中心","皮肤中心","会员中心","流量包月","定时关闭","蝰蛇音效","音乐工具","个性彩铃","私人云盘","仅WIFI联网","通知栏歌词"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 110, width: ScreenW, height: ScreenH - 190))
        
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.separatorStyle = .none
        
        self.view.backgroundColor = UIColor.init(red: 19/255.0, green: 48/255.0, blue: 100/255.0, alpha: 1.0)
        self.tableView!.backgroundColor = UIColor.init(red: 19/255.0, green: 48/255.0, blue: 100/255.0, alpha: 1.0)
        
        self.view.addSubview(self.tableView!)
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.footView)
        
        //FIXME: tableView不能交互
        self.view.isUserInteractionEnabled = true
        self.tableView?.isUserInteractionEnabled = true
        
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

extension LoginViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 9
        }else{
            return 2
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifer = "AccountCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellIdentifer)
        }
        if indexPath.section == 0 {
            cell?.imageView?.image = UIImage.init(named: self.imageArr[indexPath.row])
            cell?.textLabel?.text = self.titleArr[indexPath.row];
        }else{
            cell?.imageView?.image = UIImage.init(named: self.imageArr[indexPath.row + 9])
            cell?.textLabel?.text = self.titleArr[indexPath.row + 9];
        }
        cell?.textLabel?.textColor = UIColor.white
        cell?.contentView.backgroundColor = UIColor.init(red: 19/255.0, green: 48/255.0, blue: 100/255.0, alpha: 1.0)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath:\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UILabel.init()
        header.frame = CGRect.init(x: 30, y: 0, width: ScreenW - 60, height: 2)
        header.backgroundColor = UIColor.gray
        return header
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        }else{
            let header = UILabel.init()
            header.frame = CGRect.init(x: 30, y: 0, width: ScreenW - 60, height: 2)
            header.backgroundColor = UIColor.gray
            return header
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.1
        }else{
            return 2.0
        }
    }
}




