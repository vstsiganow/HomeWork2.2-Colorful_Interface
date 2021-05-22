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
    
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorfulView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorfulView.backgroundColor = backgroundViewColor
        
    }

    
    private var backgroundViewColor: UIColor {
        .red
    }
    
    
    

}

