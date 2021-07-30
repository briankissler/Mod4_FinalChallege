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
        
        
        NavigationView {
            
            
            VStack {
                
                ScrollView{
                    
                    
                    LazyVStack(alignment: .leading, spacing: 30) {
                        ForEach( BookModel.books ){ b in
                            NavigationLink(destination: BookDetail( book: b ) )
                            {
                                CardView(book: b)
                            }
                            
                        }
                    }
                    
                }
                
    //            List(BookModel.books) {p in
    //                CardView()
    //
    //            }
                
                .navigationTitle("My Library")
            }
        }
        //.environmentObject(ViewModel())
        
        
        //Text("Hello, world!")
        //    .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
  
    
    static var previews: some View {
        ContentView().environmentObject(ViewModel())
    }
}
