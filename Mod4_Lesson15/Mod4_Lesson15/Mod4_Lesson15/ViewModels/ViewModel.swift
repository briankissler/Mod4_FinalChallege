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
    
    func updateFavorites(bIdex:  Int  )
    {
        
        if let index = books.firstIndex(where: { $0.id == bIdex }) {
            books[index].isFavourite.toggle()
            
        }
            
    }
    
    func updateRating(bIdex:  Int,rte: Int  )
    {
        
        if let index = books.firstIndex(where: { $0.id == bIdex }) {
            books[index].rating = rte
            
        }
            
    }
    
    
    func updatePage(bIdex:  Int, page: Int  )
    {
        
        if let index = books.firstIndex(where: { $0.id == bIdex }) {
            books[index].currentPage = page
            
        }
            
    }
        
        
    
    
    
}
