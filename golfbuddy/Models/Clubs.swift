//
//  Clubs.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import Foundation



class Clubs {
    
    static let driver = Club(name: "Driver")
    static let threeWood = Club(name: "3 Wood")
    static let fiveWood = Club(name: "5 Wood")
    static let three = Club(name: "3 Iron")
    static let four = Club(name: "4 Iron")
    static let five = Club(name: "5 Iron")
    static let six = Club(name: "6 Iron")
    static let seven = Club(name: "7 Iron")
    static let eight = Club(name: "8 Iron")
    static let nine = Club(name: "9 Iron")
    static let pitchingWedge = Club(name: "Pitching Wedge")
    static let sixtyDegreeWedge = Club(name: "60 Degree Wedge")
    
    
    
    
    static func getAllAsStringArray() -> [String] {
        let arr: [String] = [driver.name, threeWood.name, fiveWood.name, three.name, four.name, five.name, six.name, seven.name, eight.name, nine.name, pitchingWedge.name, sixtyDegreeWedge.name]
        return arr
    }
    
    
    static func getAllAsClubArray() -> [Club] {
        return [driver, threeWood, fiveWood, three, four, five, six, seven, eight, nine, pitchingWedge, sixtyDegreeWedge]
    }
    
    
    static func getClubFromName(name: String) -> Club {
        let all = getAllAsStringArray()
        var ind: Int? = nil
        var i = 0
        for club in all {
            if name == club {
                ind = i
            }
            i += 1
        }
        let clubs = getAllAsClubArray()
        return clubs[ind!]
    }
    
    
}
