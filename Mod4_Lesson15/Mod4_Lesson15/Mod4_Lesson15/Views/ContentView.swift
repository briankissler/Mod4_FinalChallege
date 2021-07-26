//
//  ContentView.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    
   //@ObservedObject var BookModel = ViewModel()
   
    @EnvironmentObject var BookModel: ViewModel
    
    var body: some View {
        
        List(BookModel.books) {p in
            
            Text(p.title)
            
        }.environmentObject(ViewModel())
        
        
        //Text("Hello, world!")
        //    .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
  
    
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
