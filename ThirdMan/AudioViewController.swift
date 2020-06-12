//
//  AudioViewController.swift
//  ThirdMan
//
//  Created by Mark Meretzky on 6/11/20.
//  Copyright © 2020 New York University School of Professional Studies. All rights reserved.
//

import UIKit;
import AVKit;

class AudioViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view.
        guard let url: URL = Bundle.main.url(forResource: "thirdman", withExtension: "mp3") else {
            print("Could not create url for \"thirdman.mp3\"");
            return;
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url);
        } catch {
            print("could not create AVAudioPlayer: \(error)");  //NSError
            return;
        }
        
        audioPlayer!.volume = 1.0;       //maximum
        audioPlayer!.numberOfLoops = -1; //infinity
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        audioPlayer?.play();
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        audioPlayer?.pause();
    }
}
