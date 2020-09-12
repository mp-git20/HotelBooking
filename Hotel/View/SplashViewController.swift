//
//  SplashViewController.swift
//  Hotel
//
//  Created by APPDEV on 13/09/20.
//  Copyright © 2020 APPDEV. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
private var animationView: AnimationView?
     var timer: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Start AnimationView with animation name (without extension)
         
         animationView = .init(name: "hotelAnimation")
         
         animationView!.frame = view.bounds
         
         // 3. Set animation content mode
        animationView?.backgroundColor = .clear
         animationView!.contentMode = .scaleAspectFit
         
         // 4. Set animation loop mode
         
         animationView!.loopMode = .loop
         
         // 5. Adjust animation speed
         
         animationView!.animationSpeed = 0.5
         
         view.addSubview(animationView!)
         
         // 6. Play animation
         
         animationView!.play()
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(gotoDashboard(_:)), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }
    
    @objc func gotoDashboard(_ timer: Timer) {
    
        performSegue(withIdentifier: "dashboard", sender: nil)
    }

}
