//
//  Common.swift
//  ImitateKugouApp
//
//  Created by yetaiwen on 2018/4/4.
//  Copyright © 2018年 yetaiwen. All rights reserved.
//

import Foundation
import UIKit

let ScreenH = UIScreen.main.bounds.size.height
let ScreenW = UIScreen.main.bounds.size.width

//传递事件类型
enum ActionModel : Int{
   case ListenModel = 0
   case LookModel
   case SingModel
   case ShowAccountModel
   case DismissAccountModel
}
