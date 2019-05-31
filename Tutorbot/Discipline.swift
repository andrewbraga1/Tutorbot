//
//  Discipline.swift
//  Tutorbot
//
//  Created by student on 28/05/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
class Discipline{
    var id: String?
    var name: String?
    var description: String?
    var imagePath: String?
    
    init(name: String, imagePath: String){
        self.name = name
        self.imagePath = imagePath
    }
    init(name: String, imagePath: String, description: String){
        self.name = name
        self.imagePath = imagePath
        self.description = description
    }
}
