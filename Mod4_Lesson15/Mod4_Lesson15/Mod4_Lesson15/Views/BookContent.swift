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
    
    @State private var myPage=1
    
    @State private var page = 0
    
    
    var body: some View {
        
        TabView(selection: $myPage){
            
            //VStack{
                
                ForEach(0..<book.content.count){index in
                    
                    VStack{
                        
                        Text(book.content[index]).tag(index)
                        
                        
                        Text("PageNumber \(index+1)")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        
                        Text("myPage \(myPage)")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            
                    }
                }
                
                //Spacer()
                
                //Text("PageNumber 1")
                
                
            //}
            
           
            
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onChange(of: myPage, perform: { value in
            BookModel.updatePage(bIdex: book.id, page: myPage)
        })
        .onAppear{ myPage = book.currentPage }
        //.indexViewStyle(.page(backgroundDisplayMode: .always))
        
        
        
        
    }
}

struct BookContent_Previews: PreviewProvider {
    static var previews: some View {
        BookContent(book: Book() ).environmentObject(ViewModel())
    }
}
