//
//  EmptyStates.swift
//  Appetizers
//
//  Created by Hoon Wee on 2023/08/13.
//

import SwiftUI

struct EmptyStates: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -50)
            
        }
    }
}

struct EmptyStates_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStates(imageName: "empty-order", message: "This is our test message, blah blah any sentenceeeee.")
    }
}
