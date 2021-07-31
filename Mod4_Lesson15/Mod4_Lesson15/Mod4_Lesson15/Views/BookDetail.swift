//
//  BookDetail.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/27/21.
//

import SwiftUI

struct BookDetail: View {
    
    @EnvironmentObject var BookModel: ViewModel
    
    @State private var rating=2
    
    var book: Book
    
    
    var body: some View {
        
        VStack {
            
            NavigationLink( destination: BookContent(book: book) )
            {
                
            
            VStack{
                
                Text("Read Now!")
                
                Image("cover\(book.id)")
                    .resizable()
                    .scaledToFit()
                
                Text(book.title)
                
                
               
            }
                
            }.padding()
            
            
        
                    
            
            Button(action: { BookModel.updateFavorites(bIdex: book.id)  } ){
                
                VStack{
                
                    
                    Image(systemName: book.isFavourite ? "star.fill" : "star")
                     .frame(width: 28, height: 28,
                     alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                   .foregroundColor(.yellow)
                    
                    Text(String(book.id))
                    
                    
                    Text(String(book.isFavourite))
                    
                }
                
            }
           
            Text("Mark for later!")
                .padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            
            Text("Rate \(book.title)")
                .padding()
            
            Picker("Rate this book!", selection: $rating) {
                ForEach(1..<6) { index in
                    Text("\(index)")
                        .tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            .padding([.leading,.trailing,.bottom], 60)
            .onChange(of: rating, perform: { value in
                BookModel.updateRating(bIdex: book.id, rte: rating)
            })
                     
            
            Text("Var Rating=" + String(rating))
            
            Text("Book Rating=" + String(book.rating ))
            
            Text("Book Page=" + String(book.currentPage ))
           
            
        }
        .onAppear{ rating = book.rating }
        
        
    }
}

struct BookDetail_Previews: PreviewProvider {
    static var previews: some View {
        BookDetail(book: Book() ).environmentObject(ViewModel())
    }
}
