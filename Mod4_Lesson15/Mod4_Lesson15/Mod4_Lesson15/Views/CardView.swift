//
//  CardView.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/24/21.
//

import SwiftUI

struct CardView: View {
    
    //@EnvironmentObject var BookModel: ViewModel
    
    var book: Book
    
    var body: some View {
         
        VStack(alignment: .leading)
        {
            
            HStack {
                Text(book.title).bold()
                
                Spacer()
                
                
                if book.isFavourite
                {
                    Image(systemName: "star.fill")
                        .frame(width: 28, height: 28, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.yellow)
                        .hidden()
                        
                    
                }
                
                
            }
            
            Text(book.author)
            
                    ZStack {
                        
                        Rectangle()
                            
                        
                        Image("cover\(book.id)")
                        
                        
                        VStack {
                            Text(book.title)
                                .foregroundColor(Color.white)
                       
                            Text(book.author)
                                .foregroundColor(Color.white)
                        }
                        
                        
                        
                        
                    }.frame(width: 200, height: 400)
                    .cornerRadius(15)
                    .shadow(radius: 50)
                    .padding(30)
                    .shadow(color: .gray, radius: 5, x: -5, y: 5)
            
        }.padding()
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        
        //let myBook = Book()
        
        CardView(book: Book())
    }
}
