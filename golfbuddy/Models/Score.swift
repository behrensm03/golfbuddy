//
//  Score.swift
//  golfbuddy
//
//  Created by Michael Behrens on 8/13/19.
//  Copyright © 2019 Michael Behrens. All rights reserved.
//

import Foundation


class Score {
    
    var one: Hole
    var two: Hole
    var three: Hole
    var four: Hole
    var five: Hole
    var six: Hole
    var seven: Hole
    var eight: Hole
    var nine: Hole
    var ten: Hole
    var eleven: Hole
    var twelve: Hole
    var thirteen: Hole
    var fourteen: Hole
    var fifteen: Hole
    var sixteen: Hole
    var seventeen: Hole
    var eighteen: Hole
    
    var total: Int
    
    var course: String
    
    var holes: [Hole]
    
    
    
    init(score: [Hole], course: String) {
        
        
        one = score[0]
        two = score[1]
        three = score[2]
        four = score[3]
        five = score[4]
        six = score[5]
        seven = score[6]
        eight = score[7]
        nine = score[8]
        ten = score[9]
        eleven = score[10]
        twelve = score[11]
        thirteen = score[12]
        fourteen = score[13]
        fifteen = score[14]
        sixteen = score[15]
        seventeen = score[16]
        eighteen = score[17]
        total = 0
        self.course = course
        
        let allHoles = [one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen]
        
        for hole in allHoles {
            total += hole.numStrokes
        }
        
        self.holes = allHoles
        
    }
    
    
    
    func toString() -> String {
        var s = "Played at " + course + ". Shot a " + String(total) + ". Here's the hole-by-hole breakdown:"
        for hole in holes {
            s += " "
            s += hole.toString()
        }
        
        return s
    }
    
    
}
