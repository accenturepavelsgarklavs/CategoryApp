//
//  Model.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 10/03/2022.
//

import Foundation
import UIKit

struct SubcategoryModel {
    let subcategoryName: String
    let main: [Main]
    
    struct Main {
        let subcategoryDescription: String
        let subcategoryImage: String
    }
}
