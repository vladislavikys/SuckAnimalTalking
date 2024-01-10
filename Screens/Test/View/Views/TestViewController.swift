import Foundation
import UIKit
import BetterSegmentedControl
import SnapKit


final class TestViewController: UIBaseViewController {
        
        private var viewModel: TestViewModel // ViewModel для главного экрана
        private var collectionView: TestCollectionView! // Коллекция для отображения данных
        private var switcher: UISwitcherView! // Переключатель
        private var mainIdentifyButton: MainIdentifyViewButton! // Кнопка для идентификации
        private var bottomShadowGradientView: UIView! // Вид для отображения градиента в нижней части экрана
        
        // Инициализация ViewController с передачей ViewModel
        init(viewModel: TestViewModel) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // Добавление градиента в bottomShadowGradientView
            // Проверка наличия градиентного слоя в bottomShadowGradientView
            guard bottomShadowGradientView.layer.sublayers?.first(where: { $0.isKind(of: CAGradientLayer.self) }) == nil else {
                return
            }
            
            // Создание градиента с настройками: от полностью прозрачного черного цвета до черного с 40% непрозрачности
            bottomShadowGradientView.addGradient(colors: [UIColor.black.withAlphaComponent(0.0).cgColor,
                                                          UIColor.black.withAlphaComponent(0.4).cgColor],
                                                 locations: [0, 1])
        }

        
        override func configUI() {
            super.configUI()
            view.backgroundColor = .clear  // Устанавливает цвет фона view в прозрачный

            
            // Инициализация коллекции для основного контента
            collectionView = TestCollectionView()
            
            
            // Инициализация нижней части экрана с градиентом
            bottomShadowGradientView = UIView()
            bottomShadowGradientView.backgroundColor = .clear  // Устанавливает цвет фона в прозрачный
            bottomShadowGradientView.isUserInteractionEnabled = false  // Запрещает пользовательские взаимодействия для bottomShadowGradientView
            
            // Инициализация кнопки для идентификации основного объекта
            mainIdentifyButton = MainIdentifyViewButton()
        }

        
        override func setupLayout() {
            super.setupLayout()
    
            view.addSubview(collectionView)
            view.addSubview(bottomShadowGradientView)
            view.addSubview(mainIdentifyButton)
           
            
            // Устанавливает положение и размер коллекции контента
            collectionView.snp.makeConstraints { make in
                make.trailing.leading.equalToSuperview()
                make.bottom.equalTo(view.safeAreaLayoutGuide)
            }
            
            // Устанавливает расположение и размер кнопки для идентификации объекта
            mainIdentifyButton.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.leading.equalTo(60)
                make.trailing.equalTo(-60)
                make.height.equalTo(55)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(20)
            }
            
            // Устанавливает расположение нижней части экрана с градиентом
            bottomShadowGradientView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(collectionView).offset(-20)
            }
        }

        
        override func bind() {
            super.bind()
            
        }
    }
    






