//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yasu on 2020/03/24.
//  Copyright © 2020 tmyasu0131. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var switchButton: UIButton!
    
    // 表示している画像の番号
    var displayImageNo = 0
    
    // 画像の名前の配列
    let imageNameArray = ["1", "2", "3"]
    
    // 一定の間隔で処理を行うためのタイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 初期画面
        // バンドルした画像ファイルを読み込み
        // Image Viewに画像を設定
        let image = UIImage(named: "1")
        imageView.image = image
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のZoomViewControllerを取得する
        let zoomViewController: ZoomViewController = segue.destination as! ZoomViewController
        // 遷移先のZoomViewControllerで宣言しているdisplayZoomImageNoにdisplayImageNoを渡す
        zoomViewController.displayZoomImageNo = displayImageNo
        
        if self.timer != nil {
        self.timer.invalidate()
        // nil にして再び再生(nil の時にタイマー生成)
        self.timer = nil
        // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
        nextButton.isEnabled = true
        backButton.isEnabled = true
        // ボタンの名前を再生とする
        switchButton.setTitle("再生", for: .normal)
        // 背景色・ボタン内テキストサイズを戻す
        self.view.backgroundColor = UIColor.white
        }
    }
    
    // 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[displayImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    
    // 進むボタン
    @IBAction func nextButtonTap(_ sender: Any) {
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    // 戻るボタン
    @IBAction func backButton(_ sender: Any) {
            if displayImageNo  >= 1 && displayImageNo  <= imageNameArray.count - 1  {
                // 表示している画像の番号を1減らす
                displayImageNo -= 1
                // 表示している画像の番号を元に画像を表示する
                displayImage()
            }  else {
                displayImageNo = imageNameArray.count - 1
                displayImage()
            }
        }
    
    
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        // 進むボタンの内容を行う
        if displayImageNo < imageNameArray.count - 1 {
            // 表示している画像の番号を1増やす
            displayImageNo += 1
            // 表示している画像の番号を元に画像を表示する
            displayImage()
        } else {
            displayImageNo = 0
            displayImage()
        }
    }
    
    @IBAction func switchButtonTap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、
        //タイマーを生成して動作させる
        if self.timer == nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0,
                                              target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = false
            backButton.isEnabled = false
            // ボタンの名前を停止とする
            switchButton.setTitle("停止", for: .normal)
            // 背景色・ボタン内テキストサイズを変更
            self.view.backgroundColor = UIColor.lightGray
            
        } else if self.timer != nil {
            // タイマーを停止
            self.timer.invalidate()
            // nil にして再び再生(nil の時にタイマー生成)
            self.timer = nil
            // 再生・停止ボタンタップ時に進むボタン・戻るボタンのタップ非表示
            nextButton.isEnabled = true
            backButton.isEnabled = true
            // ボタンの名前を再生とする
            switchButton.setTitle("再生", for: .normal)
            // 背景色・ボタン内テキストサイズを戻す
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
