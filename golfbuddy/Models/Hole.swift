//
//  Hole.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import Foundation




class Hole {
    
    
    var numStrokes: Int
    var teeClub: Club
    var teeResult: TeeResult
    var holeNumber: Int
    var correctClub: Club?
    
    
    
    init(strokes: Int, club: Club, result: TeeResult, holeNum: Int) {
        numStrokes = strokes
        teeClub = club
        teeResult = result
        holeNumber = holeNum
        correctClub = nil
    }
    
    init(strokes: Int, club: Club, result: TeeResult, holeNum: Int, correctClub: Club) {
        numStrokes = strokes
        teeClub = club
        teeResult = result
        holeNumber = holeNum
        self.correctClub = correctClub
    }
    
    
    func toString() -> String {
        var s = "Shot a "
        s += String(numStrokes)
        s += " on hole #"
        s += String(holeNumber)
        s += ". Teed off with "
        s += teeClub.name
        s += " and the result was: "
        s += teeResult.result
        s += "."
        if let club = correctClub {
            s += " Should have used "
            s += club.name
            s += "."
        }
        return s
    }
    
    
    
}
