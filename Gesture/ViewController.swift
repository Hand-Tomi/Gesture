//
//  ViewController.swift
//  Gesture
//
//  Created by NZK180824A on 2019/07/09.
//  Copyright © 2019 semyeong son. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController {

    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var appleImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("viewDidLoad")
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(move))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: self, action: #selector(move))
        right.direction = .right
        let up = UISwipeGestureRecognizer(target: self, action: #selector(move))
        up.direction = .up
        let down = UISwipeGestureRecognizer(target: self, action: #selector(move))
        down.direction = .down
        
//        appleImageView.addGestureRecognizer(left) // appleImageView에서 사용하고 싶은 경우
        
        // 전 가면에서 사용하는 경우
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
        self.view.addGestureRecognizer(up)
        self.view.addGestureRecognizer(down)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(move))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func move(sender: UIGestureRecognizer) {
        os_log("move")
        
        if sender is UITapGestureRecognizer {
            centerY.constant = 0
            centerX.constant = 0
            
            // 0.3마다 갱신한다.
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded() // 갱신
            }
        }
        
        if let swipe = sender as? UISwipeGestureRecognizer {
            
            switch swipe.direction {
            case UISwipeGestureRecognizer.Direction.left:
                centerX.constant = centerX.constant - 50
                
            case .right:
                centerX.constant = centerX.constant + 50
                
            case .up:
                centerY.constant = centerY.constant - 50
                
            case .down:
                centerY.constant = centerY.constant + 50
                
            default:
                break;
            }
            
            // 0.3초 뒤에 갱신다.
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded() // 갱신
            }
            
        }
    }


}

