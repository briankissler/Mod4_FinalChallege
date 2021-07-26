//
//  CardView.swift
//  Mod4_Lesson15
//
//  Created by Brian Kissler on 7/24/21.
//

import SwiftUI

struct CardView: View {
    
    @EnvironmentObject var BookModel: ViewModel
    var body: some View {
         
            GeometryReader{ geo in
             
                 
                ZStack {
                    Rectangle()
                            .frame(width: geo.size.width - 60, height: geo.size.height - 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(radius: 30)
                        .padding(30)
                    
                    Text("TEST")
                        .foregroundColor(Color.white)
                    
                }
               
                
            }
        
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
