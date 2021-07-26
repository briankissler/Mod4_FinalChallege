//
//  ViewModel.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/23/21.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var books = [Book]()
    var myError = ""
    
    
   init()
    {
    
    books.self =  dataService.getLocalData()
    /*
    let jsonParser = JSONParser()

    jsonParser.downloadList(of: Book.self, from: "Data") { (result) in
        switch result {
            
        case .failure(let error):
            if error is DataError {
                print(error)
            } else {
                print(error.localizedDescription)
            }
            print(error.localizedDescription)
            
        case .success(let books):
            print(books)
        }
    }
    */
    
    //self.books = JSONParser.downloadList()
    
    
    }
    
    
    
}
