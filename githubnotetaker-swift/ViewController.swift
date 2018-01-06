//
//  ViewController.swift
//  githubnotetaker-swift
//
//  Created by Nicu on 06/01/2018.
//  Copyright © 2018 Nicu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var actionButton: UIButton!
    
    @IBAction func action(_ sender: UIButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

