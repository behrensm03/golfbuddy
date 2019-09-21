//
//  BrowseViewController.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    
    let scorereuse = "scorereuse"
    var scoresFlowLayout: UICollectionViewFlowLayout!
    var scoresCollectionView: UICollectionView!
    var displayScores = [Score]()
    var newButton: UIBarButtonItem!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        view.backgroundColor = .white
        self.navigationItem.title = "browse"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        
        
        
        setupCollectionViewItems()
        createAddButton()
        hardcodeData()
        setupConstraints()
    }
    
    
    func createAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        self.navigationItem.setRightBarButton(addButton, animated: true)
    }
    
    
    @objc func addButtonTapped() {
        let newScoreViewController = NewScoreViewController()
        navigationController?.pushViewController(newScoreViewController, animated: true)
    }
    
    
    
    
    
    func hardcodeData() {
        let holes = hardcodeHoles()
        let score = Score(score: holes, course: "Green Mountain National")
        let holes2 = hardcodeHolespt2()
        let score2 = Score(score: holes2, course: "Hanover Country Club")
        
        displayScores.append(score)
        displayScores.append(score2)
    }
    
    
    
    func hardcodeHoles() -> [Hole] {
        let one = Hole(strokes: 4, club: Clubs.threeWood, result: TeeResults.good, holeNum: 1)
        let two = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 2)
        let three = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 3)
        let four = Hole(strokes: 5, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 4)
        let five = Hole(strokes: 4, club: Clubs.nine, result: TeeResults.bad, holeNum: 5)
        let six = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 6)
        let seven = Hole(strokes: 4, club: Clubs.pitchingWedge, result: TeeResults.bad, holeNum: 7)
        let eight = Hole(strokes: 6, club: Clubs.five, result: TeeResults.good, holeNum: 8)
        let nine = Hole(strokes: 8, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 9)
        let ten = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 10)
        let eleven = Hole(strokes: 6, club: Clubs.five, result: TeeResults.good, holeNum: 11)
        let twelve = Hole(strokes: 6, club: Clubs.five, result: TeeResults.bad, holeNum: 12)
        let thirteen = Hole(strokes: 2, club: Clubs.pitchingWedge, result: TeeResults.good, holeNum: 13)
        let fourteen = Hole(strokes: 6, club: Clubs.five, result: TeeResults.bad, holeNum: 14)
        let fifteen = Hole(strokes: 7, club: Clubs.fiveWood, result: TeeResults.bad, holeNum: 15)
        let sixteen = Hole(strokes: 5, club: Clubs.five, result: TeeResults.bad, holeNum: 16)
        let seventeen = Hole(strokes: 4, club: Clubs.six, result: TeeResults.bad, holeNum: 17)
        let eighteen = Hole(strokes: 7, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 18)
        
        return [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen]
    }

    
    func hardcodeHolespt2() -> [Hole] {
        let one = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 1)
        let two = Hole(strokes: 5, club: Clubs.fiveWood, result: TeeResults.good, holeNum: 2)
        let three = Hole(strokes: 5, club: Clubs.fiveWood, result: TeeResults.good, holeNum: 3)
        let four = Hole(strokes: 4, club: Clubs.pitchingWedge, result: TeeResults.bad, holeNum: 4)
        let five = Hole(strokes: 3, club: Clubs.five, result: TeeResults.bad, holeNum: 5)
        let six = Hole(strokes: 4, club: Clubs.fiveWood, result: TeeResults.good, holeNum: 6)
        let seven = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 7)
        let eight = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 8)
        let nine = Hole(strokes: 7, club: Clubs.fiveWood, result: TeeResults.bad, holeNum: 9)
        let ten = Hole(strokes: 5, club: Clubs.six, result: TeeResults.bad, holeNum: 10)
        let eleven = Hole(strokes: 5, club: Clubs.fiveWood, result: TeeResults.good, holeNum: 11)
        let twelve = Hole(strokes: 3, club: Clubs.eight, result: TeeResults.good, holeNum: 12)
        let thirteen = Hole(strokes: 5, club: Clubs.threeWood, result: TeeResults.good, holeNum: 13)
        let fourteen = Hole(strokes: 5, club: Clubs.eight, result: TeeResults.bad, holeNum: 14)
        let fifteen = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 15)
        let sixteen = Hole(strokes: 6, club: Clubs.threeWood, result: TeeResults.good, holeNum: 16)
        let seventeen = Hole(strokes: 4, club: Clubs.fiveWood, result: TeeResults.good, holeNum: 17)
        let eighteen = Hole(strokes: 7, club: Clubs.threeWood, result: TeeResults.bad, holeNum: 18)
        
        return [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen]
    }

    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scoresCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scoresCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scoresCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scoresCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            ])
    }
    
    
    
    func setupCollectionViewItems() {
        scoresFlowLayout = UICollectionViewFlowLayout()
        scoresFlowLayout.scrollDirection = .vertical
        scoresFlowLayout.minimumInteritemSpacing = 25
        scoresFlowLayout.minimumLineSpacing = 25
        
        
        scoresCollectionView = UICollectionView(frame: .zero, collectionViewLayout: scoresFlowLayout)
        scoresCollectionView.translatesAutoresizingMaskIntoConstraints = false
        scoresCollectionView.backgroundColor = .white
        scoresCollectionView.dataSource = self
        scoresCollectionView.delegate = self
        scoresCollectionView.register(ScoreCollectionViewCell.self, forCellWithReuseIdentifier: scorereuse)
        view.addSubview(scoresCollectionView)
    }
    
    
    
}



extension BrowseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayScores.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scorereuse, for: indexPath) as! ScoreCollectionViewCell
        let score = displayScores[indexPath.item]
        cell.configure(for: score)
        return cell
    }
}



extension BrowseViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


extension BrowseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let length = collectionView.frame.width - 50
        return CGSize(width: length, height: length/3.0)
    }
}
