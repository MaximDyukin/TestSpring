//
//  ViewController.swift
//  TestSpring
//
//  Created by Maxim Dukin on 22.09.2021.
//

import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var viewWithAnimationDescription: SpringView!
    
    @IBOutlet weak var animationDescription: UILabel!
    
    @IBOutlet weak var runAnimationButton: UIButton!
    
    private var animationSettings: AnimationSettings!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationSettings = createAnimationSettings()
        
        animationDescription.text = """
            animation: \(animationSettings.animation)
            curve: \(animationSettings.curve)
            force: \(String(format: "%.2f", animationSettings.force))
            duration: \(String(format: "%.2f", animationSettings.duration))
        """
    }
    
    @IBAction func runAnimation() {
        
        animationDescription.text = """
            animation: \(animationSettings.animation)
            curve: \(animationSettings.curve)
            force: \(String(format: "%.2f", animationSettings.force))
            duration: \(String(format: "%.2f", animationSettings.duration))
        """
        
        viewWithAnimationDescription.animation = animationSettings.animation
        viewWithAnimationDescription.curve = animationSettings.curve
        viewWithAnimationDescription.force = CGFloat(animationSettings.force)
        viewWithAnimationDescription.duration = CGFloat(animationSettings.duration)
        viewWithAnimationDescription.animate()
        
        animationSettings = createAnimationSettings()
        
        runAnimationButton.setTitle("Run \(animationSettings.animation)", for: .normal)
    }
    
    private func createAnimationSettings() -> AnimationSettings {
        
        let animation = [
            "shake", "pop", "morph", "squeeze", "wobble", "swing", "flipX",
            "flipY", "fall", "squeezeLeft", "squeezeRight", "squeezeDown",
            "squeezeUp", "slideLeft", "slideRight", "slideDown", "slideUp",
            "fadeIn", "fadeOut", "fadeInLeft", "fadeInRight", "fadeInDown",
            "fadeInUp", "zoomIn", "zoomOut", "flash"
        ]
        
        let curve = ["spring", "linear", "easeIn", "easeOut", "easeInOut"]
        
        let animationSettings = AnimationSettings(
            animation: animation.randomElement() ?? "shake",
            curve: curve.randomElement() ?? "spring",
            force: Float.random(in: 0.5...1.5),
            duration: Float.random(in: 1...3)
        )
        
        return animationSettings
    }
}
