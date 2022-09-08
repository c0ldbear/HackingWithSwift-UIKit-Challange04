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
    var imageName: String?
    
    var captionLabel: UILabel!
    
    override func loadView() {
        view = UIView()
        
        // Caption Label
        captionLabel = UILabel()
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.font = UIFont.systemFont(ofSize: 36)
        if let caption = caption {
            captionLabel.text = caption
        } else {
            captionLabel.text = "Error!"
        }
        view.addSubview(captionLabel)
        
        // Photo View
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        if let imagePath = imageName {
            photoView.image = UIImage(contentsOfFile: imagePath)
        }
        photoView.sizeThatFits(CGSize(width: 100, height: 100))
        view.addSubview(photoView)
        
        // Constraints for label, experiment
        NSLayoutConstraint.activate([
            captionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            captionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.bottomAnchor.constraint(equalTo: captionLabel.topAnchor, constant: -25),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never // Added so that the title in detail view is small
    }
}
