//
//  EntryView.swift
//  PartyList
//
//  Created by Davide Tamiazzo on 29/06/2020.
//  Copyright © 2020 Davide Tamiazzo. All rights reserved.
//

import SwiftUI

struct EntryView: View {
    @State var playerName: String = ""
    @State var malePlayersList: [Player] = []
    @State var femalePlayersList: [Player] = []
    
    var body: some View {
        
        NavigationView{
            VStack {
                
                TextField(NSLocalizedString("Insert player...", comment: ""), text: $playerName)
                    .padding(.bottom)
                
                HStack {
                    
                    getListView(
                        list: $malePlayersList,
                        buttonText: NSLocalizedString("Add to boys", comment: ""),
                        color: Color("BoysBlue")
                    )
                    
                    getListView(
                        list: $femalePlayersList,
                        buttonText: NSLocalizedString("Add to girls", comment: ""),
                        color: Color("GirlsPink"))
                    
                    
                }
                
                NavigationLink(destination: GameView(malePlayersList: self.malePlayersList, femalePlayersList: self.femalePlayersList)) {
                    Text(NSLocalizedString("Play", comment: ""))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color("BoysBlue"), Color("GirlsPink")]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                }
                .disabled(self.malePlayersList.isEmpty || self.femalePlayersList.isEmpty)
                
                    
            }
            .navigationBarTitle("PartyList", displayMode: .large)
            .padding()
        }
       
    }
    
    func getListView(list: Binding<[Player]>,
                     buttonText: String,
                     color: Color) -> some View {
        return VStack {
            RoundedButton(
                action: {
                    if !self.playerName.isEmpty {
                        list.wrappedValue.append(Player(name: self.playerName))
                        self.playerName = ""
                    }
                },
                text: buttonText,
                color: color
            )
            .disabled(self.playerName.isEmpty)
        
            PlayersListView(playersList: list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntryView(
            malePlayersList: [Player(name: "Davide"),
                              Player(name: "Tommi")],
            femalePlayersList: [Player(name: "Giada"),
                                Player(name: "Giulia")])
    }
}
