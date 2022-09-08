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
        
//        let imageName = UUID().uuidString
//        let imagePath = getDocumentDirectory().appendingPathComponent(imageName)
//
//        if let jpegData = image.jpegData(compressionQuality: 0.8) {
//            try? jpegData.write(to: imagePath)
//        }
//
//        let person = Person(name: "Unknown", image: imageName)
//        people.append(person)
//        collectionView.reloadData()
        
        dismiss(animated: true)
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
