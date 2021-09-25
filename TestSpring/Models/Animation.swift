//
//  AnimationSettings.swift
//  TestSpring
//
//  Created by Maxim Dukin on 22.09.2021.
//


struct Animation {
    
    let animationName: String
    let curve: String
    let force: Float
    let duration: Float
    
    var description: String {
        """
        animation: \(animationName)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        """
    }
    
    static func getRandomAnimation() -> Animation {
        Animation(
            animationName: DataManager.shared.animations.randomElement() ?? "shake",
            curve: DataManager.shared.curves.randomElement() ?? "spring",
            force: Float.random(in: 0.5...1.5),
            duration: Float.random(in: 1...3)
        )
    }
}
