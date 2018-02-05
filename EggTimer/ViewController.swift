//
//  ViewController.swift
//  EggTimer
//
//  Created by Athena on 2/3/18.
//  Copyright © 2018 Sheena Elveus. All rights reserved.
//

import UIKit

let defaultTime = 210
var time = 210
//var isStopped = true

class ViewController: UIViewController {
    
    var timer = Timer() //creating a Timer obj
    @IBOutlet weak var timerLabel: UILabel!

    
    @IBAction func stopBtnPressed(_ sender: Any) {
        print("Stopped")
        timer.invalidate()
        timerLabel.text = "\(time)"
    }
    
    @IBAction func playBtnPressed(_ sender: Any) {
        
        timer=Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        timerLabel.text = "\(defaultTime)"
        time = defaultTime
        timer.invalidate()
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
 
        if( time < defaultTime && (time + 10) < defaultTime){
            time = time + 10
            timerLabel.text = "\(time)"
        }else{
            timerLabel.text = "\(defaultTime)"
        }
    }
    
    @IBAction func minusBtnPressed(_ sender: Any) {
        if( time > 0 && (time - 10) > 0){
            time = time - 10
            timerLabel.text = "\(time)"
        }else{
            timerLabel.text = "\(0)"
            timer.invalidate()
        }
    }
    
    
    @objc func processTimer(){
        print("A second has passed --> \(time)" )
        if(time > 0){
            time = time - 1
            timerLabel.text = "\(time)"
        }else{
            timer.invalidate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

