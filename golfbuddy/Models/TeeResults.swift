//
//  TeeResults.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import Foundation



class TeeResults {
    
    
    static let good = TeeResult(result: "Good")
    static let bad = TeeResult(result: "Bad")
    static let wrongClub = TeeResult(result: "Wrong Club")

    
    
    static func getAllAsStringArray() -> [String] {
        return [good.result, bad.result, wrongClub.result]
    }
    
    
    static func getResultFromString(result: String) -> TeeResult? {
        switch result {
        case "Good":
            return good
        case "Bad":
            return bad
        case "Wrong Club":
            return wrongClub
        default:
            return nil
        }
    }
    
}
