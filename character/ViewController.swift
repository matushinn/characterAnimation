//
//  ViewController.swift
//  character
//
//  Created by 大江祥太郎 on 2018/11/21.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import LTMorphingLabel

class ViewController: UIViewController {

    @IBOutlet weak var evaporate: LTMorphingLabel!
    
    @IBOutlet weak var scale: LTMorphingLabel!
    
    @IBOutlet weak var avil: LTMorphingLabel!
    @IBOutlet weak var burn: LTMorphingLabel!
    
    private var timer: Timer?
    private var index: Int = 0
    // 表示する文字リスト
    private let textList = ["Swift 3", "The powerful programming language ", "that is also easy to learn."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // エフェクトの定義
        evaporate.morphingEffect = .evaporate
        scale.morphingEffect = .scale
        burn.morphingEffect = .burn
        avil.morphingEffect = .anvil
        
        
        evaporate.delegate = self as! LTMorphingLabelDelegate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        timer = Timer.scheduledTimer(timeInterval: 3.0,
                                     target: self,
                                     selector: #selector(updateLabel(timer:)), userInfo: nil,
                                     repeats: true)
        timer?.fire()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func updateLabel(timer: Timer) {
        evaporate.text = textList[index]
        avil.text = textList[index]
        burn.text = textList[index]
        scale.text = textList[index]
        
        index += 1
        if index >= textList.count {
            index = 0
        }
    }
}

extension ViewController: LTMorphingLabelDelegate {
    
    func morphingDidStart(_ label: LTMorphingLabel) {
        print("morphingDidStart")
    }
    
    func morphingDidComplete(_ label: LTMorphingLabel) {
        print("morphingDidComplete")
    }
    
    func morphingOnProgress(_ label: LTMorphingLabel, progress: Float) {
        print("morphingOnProgress", progress)
    }
}
 


