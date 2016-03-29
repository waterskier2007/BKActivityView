//
//  ViewController.swift
//  Example
//
//  Created by Brendan Kirchner on 3/29/16.
//  Copyright © 2016 Brendan Kirchner. All rights reserved.
//

import UIKit
import ActivityView

class ViewController: UIViewController {
    
    @IBOutlet weak var activityView: ActivityView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startStop() {
        self.activityView.startOrStop()
    }


}

