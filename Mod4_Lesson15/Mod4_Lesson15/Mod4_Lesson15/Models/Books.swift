//
//  Books.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/22/21.
//

import Foundation

class Book: Identifiable, Decodable {
     
    //var id:UUID?
    var title="Test ME"
    var author="Steven King"
    var isFavourite=true
    var currentPage=1
    var rating=1
    var id=1
    var content=["TEST","TEST1"]
        
}
