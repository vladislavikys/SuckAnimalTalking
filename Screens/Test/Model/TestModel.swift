//
//  TestModel.swift
//  SuckAnimalTalking
//
//  Created by Влад on 9.01.24.
//

import Foundation

public enum PetsType {
    case cat
    case dog
    
    var localizableString: String {
        switch self {
            case .cat:
                return "Cat".localizable
            case .dog:
                return "Dog".localizable
        }
    }
}

public struct MainPetsDataModel {
    struct PetsData {
        var imageName: String
    }
    
    var type: PetsType
    var data: [PetsData]
    
    static var emptyData: MainPetsDataModel {
        return MainPetsDataModel(type: .cat, data: [])
    }
    
    public func getData(type: PetsType) -> MainPetsDataModel {
        var imagesData: [PetsData] = []
        
        switch type {
            case .cat, .dog:
                let prefix = type == .cat ? "cat_" : "dog_"
                
                // Генерируем модель данных для котов или собак с именами изображений от "cat_0"/"dog_0" до "cat_14"/"dog_14"
                for i in 0..<15 {
                    let imageName = "\(prefix)\(i)"
                    imagesData.append(PetsData(imageName: imageName))
                }
        }
        
        return MainPetsDataModel(type: type, data: imagesData)
    }
}
