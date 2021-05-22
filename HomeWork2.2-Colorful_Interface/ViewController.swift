//
//  ViewController.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 22.05.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorLabel: UILabel!
    @IBOutlet weak var alphaCoefficientLabel: UILabel!
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    
    @IBOutlet weak var colorfulView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorfulView.backgroundColor = backgroundViewColor
        colorfulView.layer.cornerRadius = 20
        colorfulView.layer.masksToBounds = true
        
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = rgbColor(red: 1, alpha: 0.9)
        
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = rgbColor(green: 1, alpha: 0.9)
        
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = rgbColor(blue: 1, alpha: 0.9)
        
        alphaSlider.minimumValue = 0
        alphaSlider.maximumValue = 1
        alphaSlider.minimumTrackTintColor = backgroundViewColor
        
    }

    func rgbColor(red: Float = 0, green: Float = 0, blue: Float = 0, alpha: Float = 1) -> UIColor {
        UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
    
    private var backgroundViewColor: UIColor {
        rgbColor(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: alphaSlider.value)
    }
    
    private func changedBackgroundColor() {
        colorfulView.backgroundColor = backgroundViewColor
        alphaSlider.minimumTrackTintColor = backgroundViewColor
    }
    
    
    @IBAction func changedRedSliderValue() {
        redColorLabel.text = String(format: "%.2f", redSlider.value)
        changedBackgroundColor()
    }
    
    @IBAction func changedGreenSliderValue() {
        greenColorLabel.text = String(format: "%.2f", greenSlider.value)
        changedBackgroundColor()
    }
    
    @IBAction func changedBlueSliderValue() {
        blueColorLabel.text = String(format: "%.2f", blueSlider.value)
        changedBackgroundColor()
    }
    
    @IBAction func changedAlphaSliderValue() {
        alphaCoefficientLabel.text = String(format: "%.2f", alphaSlider.value)
        changedBackgroundColor()
        
    }
    
    

    
}

