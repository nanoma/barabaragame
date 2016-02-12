//
//  GameViewController.swift
//  barabaragame
//
//  Created by 花田奈々 on 2016/02/12.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView3: UIImageView!
    
    @IBOutlet var resultLabel: UILabel! //スコアを表示
    var timer: NSTimer! //画像を動かすためのタイマー
    var score: Int = 0
    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults() //スコアを保存するための変数
    let width: CGFloat = UIScreen.mainScreen().bounds.size.width //画面幅
    var positionX: [CGFloat] = [0.0, 0.0, 0.0] //画像の配列
    var dx: [CGFloat] = [1.0, 0.5, -1.0] //画像を動かす幅の配列
    
    func start(){
        resultLabel.hidden = true
        timer = NSTimer.scheduledTimerWithTimeInterval(0.005, target: self, selector: "up", userInfo: nil,
        repeats: true)
        timer.fire()
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        positionX = [width/2, width/2, width/2]
        self.start()
        
        func up(){
            for i in 0..<3{
                //端に来たら動かす位置を逆にする
                if positionX[i] > width || positionX[i] < 0{
                    dx[i] = dx[i] * (-1)
                }
                positionX[i] += dx[i]
            }
            imgView1.center.x = positionX[0]
            imgView2.center.x = positionX[1]
            imgView3.center.x = positionX[2]
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stop(){
        if timer.valid == true{ //もしタイマーが動いていたら
            timer.invalidate() //止める
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
