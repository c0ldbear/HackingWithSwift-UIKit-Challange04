//
//  PhotoViewController.swift
//  Challange04
//
//  Created by teddy on 2022-09-08.
//

import Foundation
import UIKit

class PhotoViewController: UIViewController {
    
    // TODO: Add positibility to change caption with edit button, up right
    
    var caption: String?
    var image: UIImage!
    
    var captionLabel: UILabel!
    
    override func loadView() {
        view = UIView()
        
        captionLabel = UILabel()
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.font = UIFont.systemFont(ofSize: 36)
        if let caption = caption {
            captionLabel.text = caption
        } else {
            captionLabel.text = "Error!"
        }
        view.addSubview(captionLabel)
        
        // Constraints for label, experiment
        NSLayoutConstraint.activate([
            captionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
