//
//  ViewController.swift
//  SquaresActivityIndicator
//
//  Created by Ekaterina Belinskaya on 10/12/2016.
//  Copyright © 2016 Belinskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationDurationLabel: UILabel!
    @IBOutlet weak var lineWidthLabel: UILabel!
    @IBOutlet weak var ratioLabel: UILabel!
    @IBOutlet weak var ovalActivityIndicator: PulsarFlowerActivityIndicator!
    
    private let ratioText = "Oval Width/Height Ratio: "
    private let lineWidthText = "Line Width "
    private let animationDurationText = "Animation's duration: "
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ratioLabel.text = ratioText + "\(self.ovalActivityIndicator.ratio)"
        self.lineWidthLabel.text = lineWidthText + "\(self.ovalActivityIndicator.lineWidth)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func startOvalAnimation(_ sender: Any) {
        ovalActivityIndicator.startAnimation()
    }
    
    @IBAction func stopOvalAnimation(_ sender: Any) {
        ovalActivityIndicator.stopAnimation(with: nil)
    }
    
    @IBAction func increaseRatio(_ sender: Any) {
        ovalActivityIndicator.ratio += 0.1
        self.ratioLabel.text = ratioText + "\(self.ovalActivityIndicator.ratio)"
    }
    
    @IBAction func decreaseRatio(_ sender: Any) {
        ovalActivityIndicator.ratio -= 0.1
        self.ratioLabel.text = ratioText + "\(self.ovalActivityIndicator.ratio)"
    }
    
    @IBAction func increaseLineWidth(_ sender: Any) {
        ovalActivityIndicator.lineWidth += 1
        self.ratioLabel.text = ratioText + "\(self.ovalActivityIndicator.ratio)"
    }
    
    @IBAction func decreseLineWidth(_ sender: Any) {
        ovalActivityIndicator.lineWidth -= 1
        self.ratioLabel.text = ratioText + "\(self.ovalActivityIndicator.ratio)"
    }
    
    @IBAction func increaseDuration(_ sender: Any) {
        ovalActivityIndicator.duration += 1
        self.animationDurationLabel.text = animationDurationText  + "\(ovalActivityIndicator.duration)"
    }
    
    
    @IBAction func descreaseDuration(_ sender: Any) {
        ovalActivityIndicator.duration -= 1
        self.animationDurationLabel.text = animationDurationText  + "\(ovalActivityIndicator.duration)"
    }
    
    
}

