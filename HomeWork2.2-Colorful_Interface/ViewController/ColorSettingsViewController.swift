//
//  ViewController.swift
//  HomeWork2.2-Colorful_Interface
//
//  Created by vtsyganov on 22.05.2021.
//

import UIKit

protocol ColorSettingsViewControllerDelegate {
    func update(rgb: RGBA)
}

class ColorSettingsViewController: UIViewController {

    @IBOutlet var rgbLabelStackView: [UILabel]!
    @IBOutlet var rgbSlidersStackView: [UISlider]!
    @IBOutlet var rgbTFStackView: [UITextField]!
    
    @IBOutlet weak var hexButton: UIButton!
    
    @IBOutlet weak var colorfulView: UIView!
    
    var rgb: RGBA!
    
    var delegate: ColorSettingsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorfulView.layer.cornerRadius = 20
        setTrackTintColor(sliderArray: rgbSlidersStackView)
        setColorValue(labelArray: rgbLabelStackView, sliderArray: rgbSlidersStackView, textFieldArray: rgbTFStackView, rgba: rgb)
        
        colorfulView.backgroundColor = rgb.getColor
        changHexTitle()
    }
    
    @IBAction func changedSliderValue(_ sender: UISlider) {
            rgb = RGBA(
                r: rgbSlidersStackView[0].floatFormatValue2f,
                g: rgbSlidersStackView[1].floatFormatValue2f,
                b: rgbSlidersStackView[2].floatFormatValue2f,
                a: rgbSlidersStackView[3].floatFormatValue2f
            )
        
        setColorValue(labelArray: rgbLabelStackView, sliderArray: rgbSlidersStackView, textFieldArray: rgbTFStackView, rgba: rgb)
        colorfulView.backgroundColor = rgb.getColor
        changHexTitle()
    }
    
    @IBAction func changedTextField(_ sender: UITextField) {
        rgb = RGBA(
            r: rgbTFStackView[0].text?.floatValue ?? rgbSlidersStackView[0].floatFormatValue2f,
            g: rgbTFStackView[1].text?.floatValue ?? rgbSlidersStackView[1].floatFormatValue2f,
            b: rgbTFStackView[2].text?.floatValue ?? rgbSlidersStackView[2].floatFormatValue2f,
            a: rgbTFStackView[3].text?.floatValue ?? rgbSlidersStackView[3].floatFormatValue2f
        )
        
        setColorValue(labelArray: rgbLabelStackView, sliderArray: rgbSlidersStackView, textFieldArray: rgbTFStackView, rgba: rgb)
        colorfulView.backgroundColor = rgb.getColor
        changHexTitle()
    }
    
    @IBAction func pushDoneButton(_ sender: Any) {
        view.endEditing(true)
        delegate?.update(rgb: rgb)
        dismiss(animated: true)
    }
    
    @IBAction func copyHexText(_ sender: Any) {
        UIPasteboard.general.string = rgb.getColor.toHexString()
    }
    
    func setTrackTintColor(sliderArray: [UISlider]) {
        let colorSet = [ UIColor.red, UIColor.green, UIColor.blue, UIColor.white]
        for (slider, color) in zip(sliderArray, colorSet) {
            slider.minimumTrackTintColor = color
        }
    }
    
    func setColorValue(labelArray: [UILabel], sliderArray: [UISlider], textFieldArray: [UITextField], rgba: RGBA) {
        let rgbaColors = rgba.colorList
        
        for (label, colorValue) in zip(labelArray, rgbaColors) {
            label.text = String(colorValue)
        }
        for (slider, colorValue) in zip(sliderArray, rgbaColors) {
            slider.value = colorValue
        }
        for (textField, colorValue) in zip(textFieldArray, rgbaColors) {
            textField.text = String(colorValue)
        }
    }
    
    private func changHexTitle() {
        hexButton.setTitle(
            rgb.getColor.toHexString(),
            for: .normal
        )
        hexButton.setTitleColor(
            UIColor(
                red: CGFloat(1 - rgb.r),
                green: CGFloat(1 - rgb.g),
                blue: CGFloat(1 - rgb.b),
                alpha: CGFloat(0.8)
            ),
            for: .normal
        )
    }
    
}

extension ColorSettingsViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        rgb = RGBA(
            r: rgbTFStackView[0].text?.floatValue ?? rgbSlidersStackView[0].floatFormatValue2f,
            g: rgbTFStackView[1].text?.floatValue ?? rgbSlidersStackView[1].floatFormatValue2f,
            b: rgbTFStackView[2].text?.floatValue ?? rgbSlidersStackView[2].floatFormatValue2f,
            a: rgbTFStackView[3].text?.floatValue ?? rgbSlidersStackView[3].floatFormatValue2f
        )
    }
}
