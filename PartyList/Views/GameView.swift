//
//  GameView.swift
//  PartyList
//
//  Created by Davide Tamiazzo on 29/06/2020.
//  Copyright © 2020 Davide Tamiazzo. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    var malePlayersList: Array<Player>
    var femalePlayersList: Array<Player>
    
    @State var gameType: String = NSLocalizedString("Challenge", comment: "")
    @State var gameText: String = ""
    
    var body: some View {
        VStack {
            Text(gameType)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
            Text(gameText)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            
            RoundedButton(
                action: {
                    self.refresh()
                },
                text: "Next",
                color: Color("BoysBlue")
            )
        }
        .padding()
        .onAppear {
            self.refresh()
        }
    }
    
    
    func refresh() {
        let challengeIndex: Int = Int.random(in: 1..<12)
        let gameKey = "challenge" + String(challengeIndex)
        
        let challengeText = NSLocalizedString(gameKey, comment: "")
        
        let malePlayerIndex = Int.random(in: 0..<self.malePlayersList.count)
        let femalePlayerIndex = Int.random(in: 0..<self.femalePlayersList.count)
        
        let maleName = self.malePlayersList[malePlayerIndex].name
        let femaleName = self.femalePlayersList[femalePlayerIndex].name
        
        
        self.gameText = challengeText.replacingOccurrences(of: "player1", with: maleName).replacingOccurrences(of: "player2", with: femaleName)
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(malePlayersList: [Player(name: "Davide"), Player(name: "Tommi")],
        femalePlayersList: [Player(name: "Giada"), Player(name: "Giulia")])
    }
}
