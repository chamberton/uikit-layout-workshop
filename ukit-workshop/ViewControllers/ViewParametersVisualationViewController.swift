//
//  ViewController.swift
//  ukit-workshop
//
//  Created by Serge Mbamba on 2023/02/21.
//  Inspired by https://github.com/maniramezan/FrameVsBounds

import UIKit

class ViewParametersVisualationViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var containerView: UIView!
    
    // MARK: Sliders
    @IBOutlet private weak var frameXSlider: UISlider!
    @IBOutlet private weak var frameYSlider: UISlider!
    @IBOutlet private weak var frameWidthSlider: UISlider!
    @IBOutlet private weak var frameHeightSlider: UISlider!
    @IBOutlet private weak var boundsXSlider: UISlider!
    @IBOutlet private weak var boundsYSlider: UISlider!
    @IBOutlet private weak var boundsWidthSlider: UISlider!
    @IBOutlet private weak var boundsHeightSlider: UISlider!
    @IBOutlet private weak var centerXSlider: UISlider!
    @IBOutlet private weak var centerYSlider: UISlider!
    @IBOutlet private weak var rotationSlider: UISlider!
    
    // MARK: Labels
    @IBOutlet private weak var frameXLabel: UILabel!
    @IBOutlet private weak var frameYLabel: UILabel!
    @IBOutlet private weak var frameWidthLabel: UILabel!
    @IBOutlet private weak var frameHeightLabel: UILabel!
    @IBOutlet private weak var boundsXLabel: UILabel!
    @IBOutlet private weak var boundsYLabel: UILabel!
    @IBOutlet private weak var boundsWidthLabel: UILabel!
    @IBOutlet private weak var boundsHeightLabel: UILabel!
    @IBOutlet private weak var centerXLabel: UILabel!
    @IBOutlet private weak var centerYLabel: UILabel!
    @IBOutlet private weak var rotationLabel: UILabel!
    
    private var lastRoationAngle = 0
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        containerView.layer.borderColor = UIColor.green.cgColor
        containerView.layer.borderWidth = 1
        
        updateLabels()
        updateSliders()
    }
    
    // MARK: - Configure controls
    
    private func updateLabels() {
        frameXLabel.text = "frame x = \(Int(containerView.frame.origin.x))"
        frameYLabel.text = "frame y = \(Int(containerView.frame.origin.y))"
        frameWidthLabel.text = "frame width = \(Int(containerView.frame.width))"
        frameHeightLabel.text = "frame height = \(Int(containerView.frame.height))"
        boundsXLabel.text = "bounds x = \(Int(containerView.bounds.origin.x))"
        boundsYLabel.text = "bounds y = \(Int(containerView.bounds.origin.y))"
        boundsWidthLabel.text = "bounds width = \(Int(containerView.bounds.width))"
        boundsHeightLabel.text = "bounds height = \(Int(containerView.bounds.height))"
        centerXLabel.text = "center x = \(Int(containerView.center.x))"
        centerYLabel.text = "center y = \(Int(containerView.center.y))"
        rotationLabel.text = "rotation = \(Int(rotationSlider.value))"
        
    }
    
    private func updateSliders() {
        frameXSlider.value = Float(containerView.frame.origin.x)
        frameYSlider.value = Float(containerView.frame.origin.y)
        frameWidthSlider.value = Float(containerView.frame.size.width)
        frameHeightSlider.value = Float(containerView.frame.size.height)
        boundsXSlider.value = Float(containerView.bounds.origin.x)
        boundsYSlider.value = Float(containerView.bounds.origin.y)
        boundsWidthSlider.value = Float(containerView.bounds.size.width)
        boundsHeightSlider.value = Float(containerView.bounds.size.height)
        centerXSlider.value = Float(containerView.center.x)
        centerYSlider.value = Float(containerView.center.y)
    }
}

// MARK: - View paramaters updaters

extension ViewParametersVisualationViewController  {
    
    @IBAction private func frameXSliderChanged(sender: AnyObject) {
        containerView.frame.origin.x = CGFloat(frameXSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func frameYSliderChanged(sender: AnyObject) {
        containerView.frame.origin.y = CGFloat(frameYSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func frameWidthSliderChanged(sender: AnyObject) {
        containerView.frame.size.width = CGFloat(frameWidthSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func frameHeightSliderChanged(sender: AnyObject) {
        containerView.frame.size.height = CGFloat(frameHeightSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func boundsXSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func boundsYSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction func boundsWidthSliderChanged(sender: AnyObject) {
        containerView.bounds.size.width = CGFloat(boundsWidthSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func boundsHeightSliderChanged(sender: AnyObject) {
        containerView.bounds.size.height = CGFloat(boundsHeightSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func centerXSliderChanged(sender: AnyObject) {
        containerView.center.x = CGFloat(centerXSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func centerYSliderChanged(sender: AnyObject) {
        containerView.center.y = CGFloat(centerYSlider.value)
        updateLabels()
        updateSliders()
    }
    
    @IBAction private func rotationSliderChanged(sender: AnyObject) {
        let currentDegree = Int(rotationSlider.value)
        containerView.rotate(by: currentDegree - lastRoationAngle)
        lastRoationAngle = currentDegree
        updateLabels()
        updateSliders()
    }
}

extension UIView {
    func rotate(by angle: Int) {
        let radians = CGFloat(angle) / 180 * CGFloat.pi
        transform = transform.rotated(by: radians)
    }
}

