//
//  NewScoreViewController.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import UIKit

class NewScoreViewController: UIViewController {
    
    // Container views
    var contentBGView: UIView!
    var progressBGView: UIView!
    
    
    // Text Labels and Inputs
    var holeLabel: UILabel!
    
    var numStrokesLabel: UILabel!
    var numStrokesInput: UITextField!
    
    var teeClubLabel: UILabel!
    var teeClubInput: UITextField!
    
    var teeResultLabel: UILabel!
    var teeResultInput: UITextField!
    
    var courseNameLabel: UILabel!
    var courseNameInput: UITextField!
    
    var correctClubLabel: UILabel!
    var correctClubInput: UITextField!
    
    
    
    // Buttons and other elements
    var nextButton: UIButton!
    
    let clubPicker = UIPickerView()
    let clubPickerData = Clubs.getAllAsStringArray()
    
    let teeResultPicker = UIPickerView()
    let teeResultPickerData = TeeResults.getAllAsStringArray()
    
    let correctClubPicker = UIPickerView()
    let correctClubPickerData = Clubs.getAllAsStringArray()
    
    
    
    
    // Variables
    var progressCounter: CGFloat = 1.0
    
    
    var newScoreCourseName: String!
    var holes = [Hole]()

    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        view.backgroundColor = .white
        self.navigationItem.title = "New Score"
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        
        contentBGView = UIView()
        contentBGView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentBGView)
        
        
        progressBGView = UIView()
        progressBGView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBGView)
        
        
        
        clubPicker.backgroundColor = .white
        clubPicker.delegate = self
        
        
        teeResultPicker.backgroundColor = .white
        teeResultPicker.delegate = self
        
        
        correctClubPicker.backgroundColor = .white
        correctClubPicker.delegate = self
        
        
        
        

        
        
        
        setupCourseNameElements()
        setupNextButton()
        setupConstraints()
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        removeSubviews(view: progressBGView)
        showProgressBar()
    }
    
    
    func removeSubviews(view: UIView) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }
    
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            contentBGView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentBGView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentBGView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentBGView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            courseNameLabel.topAnchor.constraint(equalTo: contentBGView.topAnchor, constant: 20),
            courseNameLabel.centerXAnchor.constraint(equalTo: contentBGView.centerXAnchor),
            courseNameLabel.heightAnchor.constraint(equalToConstant: 100),
            courseNameLabel.widthAnchor.constraint(equalToConstant: 300)
            ])
        
        NSLayoutConstraint.activate([
            courseNameInput.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 20),
            courseNameInput.leadingAnchor.constraint(equalTo: courseNameLabel.leadingAnchor),
            courseNameInput.trailingAnchor.constraint(equalTo: courseNameLabel.trailingAnchor),
            courseNameInput.heightAnchor.constraint(equalToConstant: 30)
            ])
    }

    
    func setupNextButton() {
        nextButton = UIButton()
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.backgroundColor = .red
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.cornerRadius = 25
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        contentBGView.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 500),
            nextButton.centerXAnchor.constraint(equalTo: contentBGView.centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }

    
    func setupCourseNameElements() {
        courseNameLabel = UILabel()
        courseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        courseNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        courseNameLabel.textAlignment = .center
        courseNameLabel.text = "Enter course name:"
        courseNameLabel.textColor = .black
        contentBGView.addSubview(courseNameLabel)
        contentBGView.bringSubviewToFront(courseNameLabel)
        
        
        
        courseNameInput = UITextField()
        courseNameInput.translatesAutoresizingMaskIntoConstraints = false
        courseNameInput.borderStyle = .bezel
        contentBGView.addSubview(courseNameInput)
        contentBGView.bringSubviewToFront(courseNameInput)
    }
    
    
    func showProgressBar() {
        let progressView = UIView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.backgroundColor = .red
        progressBGView.addSubview(progressView)
        progressBGView.bringSubviewToFront(progressView)
        
        NSLayoutConstraint.activate([
            progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 5),
            progressView.widthAnchor.constraint(equalToConstant: getProgressBarWidth())
        ])
    }
    
    
    func getProgressBarWidth() -> CGFloat {
        let screenWidth = view.frame.width
        return progressCounter / 20.0 * screenWidth
    }
    
    
    @objc func nextButtonTapped() {
        
        let error = false
        
        if progressCounter == 1.0 {
            if let courseName = courseNameInput.text {
                newScoreCourseName = courseName
            }
        }
        
        if (progressCounter > 1.0) && (progressCounter <= 19.0) {
            saveInputData()
        }
        
        if (progressCounter < 19.0) {
            progressCounter += 1.0
            removeSubviews(view: contentBGView)
            removeSubviews(view: progressBGView)
            showProgressBar()
            setupNextButton()
            showContentForStage()
        } else if (progressCounter == 19.0) {
            print("we've reached the end, here's the hole stuff.")
            for h in holes {
                print(h.toString())
            }
        }
        
        
    }
    
    
    func showContentForStage() {
        setupHoleLabel()
        setupScoreInputs()
        setupClubInputs()
        setupResultInputs()
        setupWrongClubOptionInputs()
        hideWrongClubOptionInputs()
    }
    
    
    func setupHoleLabel() {
        holeLabel = UILabel()
        holeLabel.translatesAutoresizingMaskIntoConstraints = false
        holeLabel.textAlignment = .center
        holeLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        holeLabel.textColor = .red
        holeLabel.text = "Hole #" + String(Int(progressCounter)-1)
        contentBGView.addSubview(holeLabel)
        
        NSLayoutConstraint.activate([
            holeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            holeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            holeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            holeLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    
    func setupScoreInputs() {
        numStrokesLabel = UILabel()
        numStrokesLabel.translatesAutoresizingMaskIntoConstraints = false
        numStrokesLabel.textAlignment = .left
        numStrokesLabel.text = "Number of strokes:"
        contentBGView.addSubview(numStrokesLabel)
        
        NSLayoutConstraint.activate([
            numStrokesLabel.topAnchor.constraint(equalTo: holeLabel.bottomAnchor, constant: 20),
            numStrokesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            numStrokesLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            numStrokesLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        numStrokesInput = UITextField()
        numStrokesInput.translatesAutoresizingMaskIntoConstraints = false
        numStrokesInput.borderStyle = .bezel
        contentBGView.addSubview(numStrokesInput)
        
        NSLayoutConstraint.activate([
            numStrokesInput.topAnchor.constraint(equalTo: numStrokesLabel.topAnchor),
            numStrokesInput.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            numStrokesInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            numStrokesInput.heightAnchor.constraint(equalTo: numStrokesLabel.heightAnchor)
            ])
    }
    
    
    func setupClubInputs() {
        teeClubLabel = UILabel()
        teeClubLabel.translatesAutoresizingMaskIntoConstraints = false
        teeClubLabel.textAlignment = .left
        teeClubLabel.text = "Tee Club:"
        contentBGView.addSubview(teeClubLabel)
        
        NSLayoutConstraint.activate([
            teeClubLabel.topAnchor.constraint(equalTo: numStrokesLabel.bottomAnchor, constant: 20),
            teeClubLabel.leadingAnchor.constraint(equalTo: numStrokesLabel.leadingAnchor),
            teeClubLabel.trailingAnchor.constraint(equalTo: numStrokesLabel.trailingAnchor),
            teeClubLabel.heightAnchor.constraint(equalTo: numStrokesLabel.heightAnchor)
            ])
        
        teeClubInput = UITextField()
        teeClubInput.translatesAutoresizingMaskIntoConstraints = false
        teeClubInput.borderStyle = .roundedRect
        teeClubInput.inputView = clubPicker
        contentBGView.addSubview(teeClubInput)
        
        NSLayoutConstraint.activate([
            teeClubInput.topAnchor.constraint(equalTo: teeClubLabel.topAnchor),
            teeClubInput.leadingAnchor.constraint(equalTo: numStrokesInput.leadingAnchor),
            teeClubInput.trailingAnchor.constraint(equalTo: numStrokesInput.trailingAnchor),
            teeClubInput.heightAnchor.constraint(equalTo: teeClubLabel.heightAnchor)
            ])
    }
    
    
    func setupResultInputs() {
        teeResultLabel = UILabel()
        teeResultLabel.translatesAutoresizingMaskIntoConstraints = false
        teeResultLabel.textAlignment = .left
        teeResultLabel.text = "Tee shot result:"
        contentBGView.addSubview(teeResultLabel)
        
        NSLayoutConstraint.activate([
            teeResultLabel.topAnchor.constraint(equalTo: teeClubLabel.bottomAnchor, constant: 20),
            teeResultLabel.leadingAnchor.constraint(equalTo: teeClubLabel.leadingAnchor),
            teeResultLabel.trailingAnchor.constraint(equalTo: teeClubLabel.trailingAnchor),
            teeResultLabel.heightAnchor.constraint(equalTo: teeClubLabel.heightAnchor)
            ])
        
        teeResultInput = UITextField()
        teeResultInput.translatesAutoresizingMaskIntoConstraints = false
        teeResultInput.borderStyle = .roundedRect
        teeResultInput.inputView = teeResultPicker
        contentBGView.addSubview(teeResultInput)
        
        NSLayoutConstraint.activate([
            teeResultInput.topAnchor.constraint(equalTo: teeResultLabel.topAnchor),
            teeResultInput.leadingAnchor.constraint(equalTo: teeClubInput.leadingAnchor),
            teeResultInput.trailingAnchor.constraint(equalTo: teeClubInput.trailingAnchor),
            teeResultInput.heightAnchor.constraint(equalTo: teeResultLabel.heightAnchor)
            ])
    }
    
    
    func setupWrongClubOptionInputs() {
        correctClubLabel = UILabel()
        correctClubLabel.translatesAutoresizingMaskIntoConstraints = false
        correctClubLabel.textAlignment = .left
        correctClubLabel.text = "Correct club:"
        contentBGView.addSubview(correctClubLabel)
        
        NSLayoutConstraint.activate([
            correctClubLabel.topAnchor.constraint(equalTo: teeResultLabel.bottomAnchor, constant: 20),
            correctClubLabel.leadingAnchor.constraint(equalTo: teeResultLabel.leadingAnchor),
            correctClubLabel.trailingAnchor.constraint(equalTo: teeResultLabel.trailingAnchor),
            correctClubLabel.heightAnchor.constraint(equalTo: teeResultLabel.heightAnchor)
            ])
        
        correctClubInput = UITextField()
        correctClubInput.translatesAutoresizingMaskIntoConstraints = false
        correctClubInput.borderStyle = .roundedRect
        correctClubInput.inputView = correctClubPicker
        contentBGView.addSubview(correctClubInput)
        
        NSLayoutConstraint.activate([
            correctClubInput.topAnchor.constraint(equalTo: correctClubLabel.topAnchor),
            correctClubInput.leadingAnchor.constraint(equalTo: teeResultInput.leadingAnchor),
            correctClubInput.trailingAnchor.constraint(equalTo: teeResultInput.trailingAnchor),
            correctClubInput.heightAnchor.constraint(equalTo: teeResultInput.heightAnchor)
            ])
    }
    
    
    
    func showWrongClubOptionInputs() {
        let elements = [correctClubLabel, correctClubInput]
        for el in elements {
            el?.isHidden = false
        }
    }
    
    
    func hideWrongClubOptionInputs() {
        correctClubInput.text = ""
        let elements = [correctClubLabel, correctClubInput]
        for el in elements {
            el?.isHidden = true
        }
    }
    
    
    func saveInputData() {
        if let numStrokes = numStrokesInput.text, let club = teeClubInput.text, let result = teeResultInput.text {
            if let correctClub = correctClubInput.text, correctClub != "" {
                let hole = Hole(strokes: Int(numStrokes) ?? 0, club: Clubs.getClubFromName(name: club), result: TeeResults.getResultFromString(result: result) ?? TeeResults.good, holeNum: Int(progressCounter)-1, correctClub: Clubs.getClubFromName(name: correctClub))
                holes.append(hole)
            } else {
                let hole = Hole(strokes: Int(numStrokes) ?? 0, club: Clubs.getClubFromName(name: club), result: TeeResults.getResultFromString(result: result) ?? TeeResults.good, holeNum: Int(progressCounter)-1)
                holes.append(hole)
            }
        }
        
        
    }
    
    
    
    
    
    
    
}


extension NewScoreViewController:UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == clubPicker {
            return clubPickerData.count
        } else if pickerView == correctClubPicker {
            return correctClubPickerData.count
        } else {
            return teeResultPickerData.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == clubPicker {
            return clubPickerData[row]
        } else if pickerView == correctClubPicker {
            return correctClubPickerData[row]
        } else {
            return teeResultPickerData[row]
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == clubPicker {
            teeClubInput.text = clubPickerData[row]
        } else if pickerView == correctClubPicker {
            correctClubInput.text = correctClubPickerData[row]
        } else {
            teeResultInput.text = teeResultPickerData[row]
            if teeResultPickerData[row] == "Wrong Club" {
                showWrongClubOptionInputs()
            } else {
                hideWrongClubOptionInputs()
            }
        }
    }
    
    
}
