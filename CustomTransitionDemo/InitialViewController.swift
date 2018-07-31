//
//  ViewController.swift
//  CustomTransitionDemo
//
//  Updated by Mohamed Sobhi Fouda on 31/7/18.
//  Created by Hesham Abd-Elmegid on 6/19/16.
//  Copyright © 2016 CareerFoundy. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
}

