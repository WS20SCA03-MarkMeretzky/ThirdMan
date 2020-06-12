//
//  VideoViewController.swift
//  ThirdMan
//
//  Created by Mark Meretzky on 6/11/20.
//  Copyright © 2020 New York University School of Professional Studies. All rights reserved.
//

import UIKit;
import AVKit;

//home/m/meretzkm/public_html/INFO1-CE9236/src/orson

class VideoViewController: AVPlayerViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        
        guard let path: String = Bundle.main.path(forResource: "thirdman", ofType: "mov") else {
            print("Could not find path for resource.")
            return;
        }
        
        let url: URL = URL(fileURLWithPath: path);
        player = AVPlayer(url: url);
        player!.volume = 1.0;
    }
}
