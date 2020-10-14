//
//  TrafficLightViewController.swift
//  HomeWork2-1TaskTwo
//
//  Created by Dmitry Shcherbakov on 13.10.2020.
//

import UIKit

class TrafficLightViewController: UIViewController {

    @IBOutlet var stopTrafficLightView: UIView!
    @IBOutlet var waitTrafficLightView: UIView!
    @IBOutlet var startTrafficLightView: UIView!
    
    @IBOutlet var toggleTrafficLightColorButton: UIButton!
    
    private let lightIsOn: CGFloat = 1.0
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopTrafficLightView.alpha = lightIsOff
        waitTrafficLightView.alpha = lightIsOff
        startTrafficLightView.alpha = lightIsOff
        
        toggleTrafficLightColorButton.setTitle("START", for: .normal)
        toggleTrafficLightColorButton.layer.cornerRadius = 10
    }
    
    override func viewWillLayoutSubviews() {
        stopTrafficLightView.layer.cornerRadius = stopTrafficLightView.frame.width / 2
        waitTrafficLightView.layer.cornerRadius = waitTrafficLightView.frame.width / 2
        startTrafficLightView.layer.cornerRadius = startTrafficLightView.frame.width / 2
    }

    @IBAction func toggleTrafficLightColorButtonPressed() {
        if toggleTrafficLightColorButton.currentTitle == "START" {
            toggleTrafficLightColorButton.setTitle("NEXT", for: .normal)
        }
        
        let lightIsOnExists = [
            stopTrafficLightView,
            waitTrafficLightView,
            startTrafficLightView
        ].contains() { $0.alpha == lightIsOn }
        
        if !lightIsOnExists {
            stopTrafficLightView.alpha = lightIsOn
        } else if stopTrafficLightView.alpha == lightIsOn {
            stopTrafficLightView.alpha = lightIsOff
            waitTrafficLightView.alpha = lightIsOn
        } else if waitTrafficLightView.alpha == lightIsOn {
            waitTrafficLightView.alpha = lightIsOff
            startTrafficLightView.alpha = lightIsOn
        } else if startTrafficLightView.alpha == lightIsOn {
            startTrafficLightView.alpha = lightIsOff
            stopTrafficLightView.alpha = lightIsOn
        }
    }
}

