//
//  HabitDetailedViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/21/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class HabitDetailedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageViewIcon)
        imageViewIconConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    var habit: HabitModel!
    var habitIndex: Int!
    private var persistence = PresistenceObject()
    
    lazy var imageViewIcon: UIImageView = {
        let imageViewIcon = UIImageView(frame: .zero)
        imageViewIcon.contentMode = .scaleAspectFit
        imageViewIcon.translatesAutoresizingMaskIntoConstraints = false
        //        pickedImage.image = UIImage(named: "book")
        return imageViewIcon
    }()
    
    func imageViewIconConstraints() {
        NSLayoutConstraint.activate([
            imageViewIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            imageViewIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            imageViewIcon.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 3),
            imageViewIcon.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    lazy var labelCurrentStreak: UILabel = {
        let labelCurrentStreak = UILabel(frame: .zero)
        labelCurrentStreak.translatesAutoresizingMaskIntoConstraints = false
        labelCurrentStreak.backgroundColor = .systemRed
        labelCurrentStreak.textAlignment = .center
        return labelCurrentStreak
    }()
    
    lazy var labelTotalCompletions: UILabel = {
        let labelTotalCompletions = UILabel(frame: .zero)
        labelTotalCompletions.translatesAutoresizingMaskIntoConstraints = false
        labelTotalCompletions.backgroundColor = .systemRed
        labelTotalCompletions.textAlignment = .center
        return labelTotalCompletions
    }()
    
    lazy var labelBestStreak: UILabel = {
        let labelBestStreak = UILabel(frame: .zero)
        labelBestStreak.translatesAutoresizingMaskIntoConstraints = false
        labelBestStreak.backgroundColor = .systemRed
        labelBestStreak.textAlignment = .center
        return labelBestStreak
    }()
    
    lazy var labelStartingDate: UILabel = {
        let labelStartingDate = UILabel(frame: .zero)
        labelStartingDate.translatesAutoresizingMaskIntoConstraints = false
        labelStartingDate.backgroundColor = .systemRed
        labelStartingDate.textAlignment = .center
        return labelStartingDate
    }()
    
    lazy var buttonAction: UIButton = {
        let buttonAction = UIButton(frame: .zero)
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.backgroundColor = .systemRed
        buttonAction.setTitle("Mark as completed" , for: .normal)
        buttonAction.addTarget(self, action: #selector(pressActionButton), for: .touchUpInside)
        return buttonAction
    }()
    
    @objc func pressActionButton() {
        habit = persistence.markHabitAsCompleted(habitIndex)
        updateUI()
    }
    
    
    private func updateUI() {
        title = habit.title
        imageViewIcon.image = habit.selectedImage.image
        labelCurrentStreak.text = "\(habit.currentStreak) days"
        labelTotalCompletions.text = String(habit.numberOfCompletions)
        labelBestStreak.text = String(habit.bestStreak)
        labelStartingDate.text = habit.dateCreated.stringValue
        
        if habit.completedToday {
            buttonAction.setTitle("Completed for Today!", for: .normal)
        } else {
            buttonAction.setTitle("Mark as Completed", for: .normal)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
