//
//  CustomPresentAnimator.swift
//  CustomTransitionDemo
//
//  Created by Mohamed Sobhi  Fouda on 7/31/18.
//  Copyright © 2018 CareerFoundy. All rights reserved.
//

import UIKit

class CustomPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }
        
        toViewController.view.alpha = 0
        transitionContext.containerView.addSubview(toViewController.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.alpha = 1
        }, completion: {
            completed in
            transitionContext.completeTransition(true)
        })
    }
    
}
