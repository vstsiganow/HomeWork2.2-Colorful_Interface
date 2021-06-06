//
//  MainScreenViewController.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 04.06.2021.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    private var rgb = RGBA(r: 1, g: 1, b: 1, a: 1) {
        didSet {
            view.backgroundColor = rgb.getColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = rgb.getColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.rgb = rgb
        colorSettingsVC.delegate = self
    }
}

extension MainScreenViewController: ColorSettingsViewControllerDelegate {
    func update(rgb: RGBA) {
        self.rgb = rgb
    }
}
