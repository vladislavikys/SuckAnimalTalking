//
//  TestCollectionView.swift
//  SuckAnimalTalking
//
//  Created by Влад on 10.01.24.
//

import UIKit
import Foundation
import SnapKit

// Класс для отображения коллекции
final class TestCollectionView: UICollectionView {
    
    // Данные о питомцах, изначально пустые
    private var petsData: MainPetsDataModel = MainPetsDataModel.emptyData.getData(type: .cat)
    
    // Отступы от краев экрана для ячеек коллекции
    private var contentInsentsValue: UIEdgeInsets = UIEdgeInsets(top: 14, left: 24,
                                                                 bottom: (currentSafeAreaInsetsOnDevice?.bottom ?? 60) + 100, right: 24)
    
    // Размер ячейки коллекции, вычисляемый на основе размеров экрана
    private var cellSize: CGSize {
        var widthArea = self.bounds.width - (contentInsentsValue.left + contentInsentsValue.right)
        let spacing: CGFloat = 14 * 2
        widthArea -= spacing
        return CGSize(width: widthArea / 3, height: widthArea / 3)
    }
    
    // Инициализация коллекции
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical // Установка вертикальной прокрутки
        super.init(frame: frame, collectionViewLayout: flow)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Настройка основных свойств коллекции
    private func setup() {
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = .clear // Прозрачный фон коллекции
        self.contentInset = contentInsentsValue // Установка отступов
        self.layoutIfNeeded()
        self.showsVerticalScrollIndicator = true // Отображение вертикального индикатора прокрутки
        self.register(TestCollectionCell.self, forCellWithReuseIdentifier: TestCollectionCell.cellID) // Регистрация ячейки
    }
}

// Расширение для обработки делегата и источника данных коллекции
extension TestCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return petsData.data.count // Возвращаем количество элементов в коллекции
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TestCollectionCell.cellID, for: indexPath) as! TestCollectionCell
        cell.setData(data: petsData.data[indexPath.row]) // Установка данных в ячейку
        return cell
    }
}

// Расширение для обработки делегата UICollectionViewDelegateFlowLayout
extension TestCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize // Возвращаем размер ячейки
    }
}

