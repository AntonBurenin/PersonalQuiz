//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // 1. Передать массив с ответами на этот экран
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результаты на экране
    // 4. Избавится от кнопки back
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        let resultAnimal = calculateResult()
        
        emojiLabel.text = "Вы - " + String(resultAnimal.rawValue)
        descriptionLabel.text = resultAnimal.definition
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    
    private func calculateResult() -> AnimalType {
        var results = [AnimalType.cat : 0, AnimalType.rabbit : 0, AnimalType.turtle : 0, AnimalType.dog : 0]
        for answer in answers {
            results[answer.type]! += 1
        }
        let sortResults =  results.sorted(by: { $0.value > $1.value})
        return sortResults.first!.key
    }
}
