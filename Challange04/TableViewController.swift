//
//  ViewController.swift
//  Challange04
//
//  Created by teddy on 2022-09-08.
//

import UIKit

class TableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(takePhoto))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath)
        if photos.isEmpty {
            cell.textLabel?.text = "Photo #\(indexPath.row + 1)"
        } else {
            let photo = photos[indexPath.row]
            cell.textLabel?.text = photo.caption
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = PhotoViewController()
        let cell = tableView.cellForRow(at: indexPath)
        detailView.caption = cell?.textLabel?.text
        navigationController?.pushViewController(detailView, animated: true)
    }
    
    @objc func takePhoto() {
        let picker = UIImagePickerController()
//        picker.sourceType = .camera // uncomment when used on device
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
}

