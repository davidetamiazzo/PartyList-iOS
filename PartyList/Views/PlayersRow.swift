//
//  PlayersRow.swift
//  PartyList
//
//  Created by Davide Tamiazzo on 29/06/2020.
//  Copyright © 2020 Davide Tamiazzo. All rights reserved.
//

import SwiftUI

struct PlayersRow: View {
    
    var playerName: String
    
    var body: some View {
        Text(playerName).frame(alignment: .leading)
    }
}

struct PlayersRow_Previews: PreviewProvider {
    static var previews: some View {
        PlayersRow(playerName: "Davide")
            .previewLayout(.fixed(width: 300, height: 20))
    }
}
