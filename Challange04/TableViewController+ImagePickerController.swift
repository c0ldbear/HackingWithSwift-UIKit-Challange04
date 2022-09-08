//
//  TableViewController+ImagePickerController.swift
//  Challange04
//
//  Created by teddy on 2022-09-08.
//

import Foundation
import UIKit

extension TableViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        let imageId = UUID().uuidString
        let imagePath = getDocumentDirectory().appendingPathComponent(imageId)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let ac = UIAlertController(title: "Photo caption", message: "", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] _ in
            let caption = ac?.textFields?[0].text
            let photo = Photo(id: imageId, caption: caption ?? "")
            self?.photos.append(photo)
            self?.tableView.reloadData()
            self?.savePhotosToUserDefaults()
        })
        
        dismiss(animated: true)
        
        present(ac, animated: true)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
