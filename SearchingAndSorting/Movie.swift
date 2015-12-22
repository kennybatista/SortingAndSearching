//
//  Movie.swift
//  SearchingAndSorting
//
//  Created by Kenny Batista on 12/21/15.
//  Copyright © 2015 Kenny Batista. All rights reserved.
//

import Foundation


class Movie {
    var title: String
    var grossing:Float
    
    init(titleValue:String, grossingValue: Float) {
        title = titleValue
        grossing = grossingValue
    }
}