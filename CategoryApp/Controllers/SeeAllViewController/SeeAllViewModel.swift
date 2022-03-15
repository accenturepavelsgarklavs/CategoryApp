//
//  SeeAllViewModel.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 14/03/2022.
//

import Foundation

final class SeeAllViewModel {
    var index: Int?
    
    let taskManager = TaskManager.shared.data
    
    func setIndexOfModel(index: Int) {
        self.index = index
    }
}
