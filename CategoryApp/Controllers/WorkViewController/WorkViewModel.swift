//
//  WorkViewModel.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 09/03/2022.
//

import Foundation

final class WorkViewModel {
    let taskManager = TaskManager.shared.data
    
    var onSeeAllButton: ((Int) -> Void)?
}
