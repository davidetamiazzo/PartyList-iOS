//
//  PlayersListView.swift
//  PartyList
//
//  Created by Davide Tamiazzo on 29/06/2020.
//  Copyright © 2020 Davide Tamiazzo. All rights reserved.
//

import SwiftUI

struct PlayersListView: View {
    
    @Binding var playersList: Array<Player>
    var body: some View {
        
        List{
            ForEach(playersList, id: \.name) { player in
            
                PlayersRow(playerName: player.name)
            }
            .onDelete(perform: delete)
        }
        .cornerRadius(10)
    }
    
    func delete(at offsets: IndexSet) {
        playersList.remove(atOffsets: offsets)
    }
    
    

}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
         BindingPreviewWrapper()
    }
}

/*
    we need to use a fake view as a wrapper that takes playersList as a @State
    otherwise we cannot pass it as the argument of PlayersListView(playersList:)
 */
struct BindingPreviewWrapper : View {
     @State var playersList = [Player(name: "Davide"), Player(name: "Tommi")]

     var body: some View {
          PlayersListView(playersList: $playersList)
     }
}
