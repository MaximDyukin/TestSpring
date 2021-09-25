//
//  ViewController.swift
//  TestSpring
//
//  Created by Maxim Dukin on 22.09.2021.
//

import Spring

class ViewController: UIViewController {
    
    // MARK: - IB Outlet
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationDescription: UILabel!
    
    // MARK: - Private properties
    private var animation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationDescription.text = animation.description
    }
    
    // MARK: - IBActions
    @IBAction func runAnimation(_ sender: UIButton) {
        animationDescription.text = animation.description
        
        animationView.animation = animation.animationName
        animationView.curve = animation.curve
        animationView.force = CGFloat(animation.force)
        animationView.duration = CGFloat(animation.duration)
        animationView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.animationName)", for: .normal)
    }
}
