//
//  BookContent.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/27/21.
//

import SwiftUI

struct BookContent: View {
    
    @EnvironmentObject var BookModel: ViewModel
    
    var book: Book
    
    
    var body: some View {
        
        TabView{
            
            //VStack{
                
                ForEach(0..<book.content.count){index in
                    
                    VStack{
                        
                        Text(book.content[index])
                        
                        
                        Text("PageNumber \(index+1)")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                    }
                }
                
                //Spacer()
                
                //Text("PageNumber 1")
                
                
            //}
            
           
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        //.indexViewStyle(.page(backgroundDisplayMode: .always))
        
        
        
        
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        BookContent(book: Book() )
    }
}
