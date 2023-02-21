//
//  ProgrammaticConstraintsViewController.swift
//  ukit-workshop
//
//  Created by Serge Mbamba on 2023/02/21.
//

import UIKit

class ProgrammaticConstraintsViewController: UIViewController {
    private let selecteCardLabel = UILabel()
    private let checkbox = UISwitch()
    
    var constrainedViews: [UIView] {
        [selecteCardLabel, checkbox]
    }
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        insertSubviews()
        configureControls()
    }
    
    // MARK: - View layout
    private func insertSubviews() {
        constrainedViews.forEach { contrainedView in
            contrainedView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contrainedView)
        }
        selecteCardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 107).isActive = true
        selecteCardLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 19).isActive = true
        selecteCardLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkbox.topAnchor.constraint(equalTo: selecteCardLabel.topAnchor, constant: 40).isActive = true

    }
    
    // MARK: - Controls set up
    private func configureControls() {
        selecteCardLabel.text = "Select Your Card"
        
    }
    

}
