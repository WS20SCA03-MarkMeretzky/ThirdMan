//
//  TextViewController.swift
//  ThirdMan
//
//  Created by Mark Meretzky on 6/11/20.
//  Copyright © 2020 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

class TextViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        textView.textContainerInset = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0);
    }
}
