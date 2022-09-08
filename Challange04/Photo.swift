//
//  Photo.swift
//  Challange04
//
//  Created by teddy on 2022-09-08.
//

import Foundation
import UIKit

class Photo: Codable {
    var imageID: String
    var caption: String
    
    init(id: String, caption: String) {
        self.caption = caption
        imageID = id
    }
}
