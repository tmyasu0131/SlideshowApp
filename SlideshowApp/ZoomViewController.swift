//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by yasu on 2020/03/26.
//  Copyright © 2020 tmyasu0131. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {
    
    
    @IBOutlet weak var zoomView: UIImageView!
    @IBOutlet weak var backPageButton: UIButton!

    let imageNameArray = ["1", "2", "3"]
    
    // ViewControllerからdisplayZoomImageNoを受け取る
    var displayZoomImageNo:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = imageNameArray[displayZoomImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        zoomView.image = image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
