//
//  second.swift
//  test2
//
//  Created by 永田祐太郎 on 2016/12/29.
//  Copyright © 2016年 大木優介. All rights reserved.
//

import UIKit

class second: UIViewController {
    
    @IBOutlet weak var label4: UILabel!
    
    override func viewDidLoad() {

        label4.text = "コイン：\(coin)"
        
    }
}
