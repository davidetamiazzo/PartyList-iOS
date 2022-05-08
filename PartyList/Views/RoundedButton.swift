//
//  RoundedButton.swift
//  PartyList
//
//  Created by Davide Tamiazzo on 08/05/22.
//  Copyright © 2022 Davide Tamiazzo. All rights reserved.
//

import SwiftUI

struct RoundedButton: View {
    
    var action: ()->Void
    var text: String
    var color: Color
    
    var body: some View {
        
        Button(action: action) {
            Text(text)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .foregroundColor(.white)
        .background(color)
        .cornerRadius(10)
    
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(action: {}, text: "Prova", color: Color("BoysBlue"))
            .previewLayout(.fixed(width: 200, height: 100))
    }
}
