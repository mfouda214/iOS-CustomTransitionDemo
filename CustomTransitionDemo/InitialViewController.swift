//
//  ViewController.swift
//  CustomTransitionDemo
//
//  Updated by Mohamed Sobhi Fouda on 31/7/18.
//  Created by Hesham Abd-Elmegid on 6/19/16.
//  Copyright © 2016 CareerFoundy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    let customInteractionAnimator = CustomInteractionAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentPhotoController" {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomPresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomDismissAnimator()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    let customNavigationAnimator = CustomNavigationAnimator()
    
    if operation == .push {
    customNavigationAnimator.pushing = true
    customInteractionAnimator.addToViewController(viewController: toVC)
    }
    
    return customNavigationAnimator
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return customInteractionAnimator.transitionInProgress ? customInteractionAnimator : nil
    }
    
}

