//
//  AddHabitViewController.swift
//  HabitCount
//
//  Created by Mohammed Drame on 3/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit

class AddHabitViewController: UIViewController {
    
    let habitImages = HabitModel.Images.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainCollectionView)
        mainCollectionViewConstraints()
        view.addSubview(pickedPhotoButton)
        pickedPhotoButtonConstraints()
        
    }
    
    
    lazy var mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let mainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        mainCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.cellIdentifier)
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        mainCollectionView.backgroundColor = .systemPink
        return mainCollectionView
    }()
    
    func mainCollectionViewConstraints() {
        
                mainCollectionView.delegate = self
                mainCollectionView.dataSource = self
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    lazy var pickedPhotoButton: UIButton = {
        let pickedPhotoButton = UIButton(frame: .zero)
        pickedPhotoButton.backgroundColor = .systemYellow
        pickedPhotoButton.setTitle("Pick Photo", for: .normal)
        pickedPhotoButton.translatesAutoresizingMaskIntoConstraints =  false
        pickedPhotoButton.addTarget(self, action: #selector(pickButtonPressed), for: .touchUpInside)
        pickedPhotoButton.setTitleColor(#colorLiteral(red: 0.1512203515, green: 0.1612353325, blue: 0.1522695124, alpha: 1), for: .normal)
        pickedPhotoButton.titleLabel?.font = UIFont(name: "Arial", size: 20)
        pickedPhotoButton.clipsToBounds = true
        pickedPhotoButton.layer.cornerRadius = 20
        return pickedPhotoButton
    }()
    
    @objc func pickButtonPressed() {
        print("Image Picked")
    }
    
    func pickedPhotoButtonConstraints() {
        NSLayoutConstraint.activate([
            pickedPhotoButton.topAnchor.constraint(equalTo: mainCollectionView.bottomAnchor, constant: 10),
            pickedPhotoButton.leadingAnchor.constraint(equalTo: mainCollectionView.leadingAnchor),
            pickedPhotoButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            pickedPhotoButton.trailingAnchor.constraint(equalTo: mainCollectionView.trailingAnchor)
        ])
    }
    
 
}


extension AddHabitViewController {
    
    func setupNavBar() {
        title = "Select Image"
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelAddHabit(_:)))
        navigationItem.leftBarButtonItem = cancelButton
    }
    
    @objc func cancelAddHabit(_ sender: UIBarButtonItem) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}




extension AddHabitViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitImages.count
       }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.cellIdentifier, for: indexPath) as? CustomCollectionViewCell {
            cell.setUI(object: habitImages[indexPath.row].image)
            cell.backgroundColor = .white
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width / 4, height: 100)
    }
    
    
   
    
    
}
