//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Aaron Thompson on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var round = 1
    @State private var playerScore = 0
    @State private var cpuScore = 0
    
    @State private var toWin = Bool.random()

    @State private var playerChoice = ""
    @State private var cpuChoice = ""
    
    let options = ["Rock", "Scissors", "Paper"]
    
    
    
    var body: some View {
        
        ZStack {
            
            VStack{
                VStack{
                    round < 10 ? Text("Round \(round)") : Text("Final Round")
                }.font(.largeTitle.weight(.semibold)).padding(.bottom, 18)
                
                HStack{
                    VStack{
                        Text("Player").font(.title)
                        Text("\(playerScore)")
                    }
                    Spacer()
                    VStack{
                        Text("Cpu").font(.title)
                        Text("\(cpuScore)")
                    }
                }
                
                VStack{
                    toWin ? Text("Win") : Text("Lose").foregroundStyle(.red)
                }.font(.largeTitle.weight(.semibold)).padding(.bottom, 18)
                Spacer()
                
            
                HStack {
                    Text("\(playerChoice)")
                    Text("Vs").font(.largeTitle).padding()
                    Text("\(cpuChoice)")
                }

                Spacer()
                
                
                HStack(spacing: 50) {
                    ForEach(0..<3){ number in
                        Button(){
                            shoot(number)
                        } label: {
                            Text("\(options[number])")
                        }
                    }
                }
                
            }
        }.padding()
    }
    
    func shoot(_ number: Int){
        playerChoice = options[number]
        cpuChoice = options[ Int.random(in: 0...2) ]
        
        if playerChoice == cpuChoice {
            print("Draw")
        } else if toWin && (playerChoice == "Rock" && cpuChoice == "Scissors" || playerChoice == "Paper" && cpuChoice == "Rock" || playerChoice == "Scissors" && cpuChoice == "Rock"){
            print("Win")
            playerScore += 1
        }
        else {
            print("Lose")
            cpuScore += 1
        }
        round += 1
        toWin = Bool.random()
    }
}

#Preview {
    ContentView()
}
