//
//  TaskManager.swift
//  CategoryApp
//
//  Created by pavels.garklavs on 11/03/2022.
//

import Foundation

struct TaskManager {
    
    static let shared = TaskManager()
    
    private init() {
        addDummyValue()
    }
    
    var data: [SubcategoryModel] = []
    
    // MARK: Dummy Data
    mutating func addDummyValue() {
        
        // Sub Category One
        var subcategoryOneCellData: [SubcategoryModel.Main] = []
        
        let subOneCellOneData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub one test 1", subcategoryImage: "cell-background-image")
        let subOneCellTwoData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub one test 2", subcategoryImage: "cell-background-image")
        let subOneCellThreeData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub one test 3", subcategoryImage: "cell-background-image")
        
        subcategoryOneCellData.append(subOneCellOneData)
        subcategoryOneCellData.append(subOneCellTwoData)
        subcategoryOneCellData.append(subOneCellThreeData)
        
        // Sub Category Two
        var subcategoryTwoCellData: [SubcategoryModel.Main] = []
        
        let subTwoCellOneData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub two test 1", subcategoryImage: "cell-background-image")
        let subTwoCellTwoData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub two test 2", subcategoryImage: "cell-background-image")
        let subTwoCellThreeData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub two test 3", subcategoryImage: "cell-background-image")
        let subTwoCellFourData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub two test 4", subcategoryImage: "cell-background-image")
        let subTwoCellFiveData: SubcategoryModel.Main = SubcategoryModel.Main(subcategoryDescription: "Sub two test 5", subcategoryImage: "cell-background-image")
        
        subcategoryTwoCellData.append(subTwoCellOneData)
        subcategoryTwoCellData.append(subTwoCellTwoData)
        subcategoryTwoCellData.append(subTwoCellThreeData)
        subcategoryTwoCellData.append(subTwoCellFourData)
        subcategoryTwoCellData.append(subTwoCellFiveData)
        
        // Inserting into Fake Model
        let subcategoryOne = SubcategoryModel(subcategoryName: "Sub Category One", main: subcategoryOneCellData)
        let subcategoryTwo = SubcategoryModel(subcategoryName: "Sub Category Two", main: subcategoryTwoCellData)
        data.append(subcategoryOne)
        data.append(subcategoryTwo)
    }
}
