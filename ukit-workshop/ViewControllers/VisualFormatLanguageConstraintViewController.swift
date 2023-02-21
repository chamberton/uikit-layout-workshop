//
//  VisualFormatLanguageConstraintViewController.swift
//  ukit-workshop
//
//  Created by Serge Mbamba on 2023/02/21.
//

import UIKit

class VisualFormatLanguageConstraintViewController: UIViewController {
    private lazy var views: [String: UIView] = [
      "selecteCardLabel": selecteCardLabel,
      "parentView": view,
      "checkbox": checkbox]
    private lazy var selectCardLabelContraints = NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-107-[selecteCardLabel(40)]-40-[checkbox]",
      metrics: nil,
      views: views)
    private lazy var horizontalContraints = NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-19-[selecteCardLabel(>=200)]",
      metrics: nil,
      views: views)

    private lazy var horizontalCentering = NSLayoutConstraint.constraints(
        withVisualFormat: "V:[parentView]-(<=1)-[checkbox]",
        options: NSLayoutConstraint.FormatOptions.alignAllCenterX,
        metrics: nil,
        views: views)
    
    private let selecteCardLabel = UILabel()
    private let checkbox = UISwitch()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviews()
        configureControls()
    }
    
    // MARK: - View layout
    private func insertSubviews() {
        views.values.forEach { contrainedView in
            if contrainedView === view {
                return
            }
            contrainedView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contrainedView)
        }
        NSLayoutConstraint.activate(selectCardLabelContraints + horizontalContraints + horizontalCentering)
    }
    
    // MARK: - Controls set up
    private func configureControls() {
        selecteCardLabel.text = "Select Your Card"
        
    }
    
   
}
