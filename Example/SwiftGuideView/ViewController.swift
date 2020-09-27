//
//  ViewController.swift
//  SwiftGuideView
//
//  Created by jackiehu on 09/27/2020.
//  Copyright (c) 2020 jackiehu. All rights reserved.
//

import UIKit
import SwiftGuideView
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            SwiftGuideView.showGuide(pageArray: ["1","2","3","4","5"], fromVC: self) { (c) in
                c.openButtonTitle = "进入APP"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

