//
//  ViewController.swift
//  test2
//
//  Created by 大木優介 on 2016/10/15.
//  Copyright © 2016年 大木優介. All rights reserved.
//



import UIKit




class ViewController: UIViewController {
    
    var coin = 100
    var countNum = 0
    var timerRunning = false
    var timer = Timer()
    var ruiseki_time = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    let userDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 以前のデータがある場合のみ、coinを更新
        if userDefaults.integer(forKey: "testInt") > 0{
            coin = userDefaults.integer(forKey: "testInt")
        }
        label2.text = "コイン：\(coin)"
        }
    
    func update() {
        countNum += 1;
        label.text = "\(countNum)"
    }

    @IBAction func start(_ sender: AnyObject) {
        
        if timerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
            timerRunning = true
        }
    }
    
    
    @IBAction func reset(_ sender: AnyObject) {
        if timerRunning == true {
            timer.invalidate()
            timerRunning = false
        }
        ruiseki_time = ruiseki_time + countNum;
        coin = coin + ruiseki_time/5;
        countNum = 0
        ruiseki_time = 0
        label.text = "0"
        label2.text = "コイン：\(coin)"
        
        //Int型のデータを保存
        userDefaults.set(coin, forKey: "testInt")
        
        //plistファイルへの出力と同期する。
        userDefaults.synchronize()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

