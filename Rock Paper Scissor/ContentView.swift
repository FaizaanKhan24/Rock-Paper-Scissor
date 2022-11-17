//
//  ContentView.swift
//  Rock Paper Scissor
//
//  Created by Faizaan Khan on 11/15/22.
//

import SwiftUI

struct ContentView: View {
    let userOptions = ["Rock", "Paper", "Scissor"]
    let counterOptions = ["Paper", "Scissor", "Rock"]
    
    @State private var userChoice: Int = 0
    @State private var compChoice: Int = 0
    @State private var userScore: Int = 0
    @State private var compScore: Int = 0
    @State private var turns: Int = 0
    
    @State private var turnStatus: String = ""
    
    @State private var isShowMove: Bool = false
    @State private var isGameOver: Bool = false
    @State private var isturnWon: Bool = false
    
    var body: some View {
        ZStack{
            Color(red: 0.3, green: 0.2, blue: 0.75)
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("Rock-Paper-Scissors")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                
                Spacer()
                Spacer()
                
                HStack(spacing: 25){
                    VStack(spacing: 15){
                        Text("Your Score:")
                            .foregroundColor(.yellow)
                            .font(.system(size: 25).weight(.light))
                        Text("\(userScore)")
                            .foregroundColor(.yellow)
                            .font(.system(size: 50).weight(.bold))
                    }
                    
                    VStack(spacing: 15){
                        Text("Comp Score:")
                            .foregroundColor(.yellow)
                            .font(.system(size: 25).weight(.light))
                        Text("\(compScore)")
                            .foregroundColor(.yellow)
                            .font(.system(size: 50).weight(.bold))
                    }
                }
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                Text("Turns left: \(5-turns)")
                    .foregroundColor(.white)
                    .font(.system(size: 25).weight(.ultraLight))
                
                Spacer()
                
                VStack{
                    Spacer()

                    
                    HStack{
                        
                        Button("🤜🏼"){
                            // Rock
                            userChoice(choice: 0)
                        }
                        .frame(minWidth: 100, minHeight: 100)
                        .background(.regularMaterial)
                        .font(.system(size: 100))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                        
                        
                        Button("🖐🏼"){
                            // Paper
                            userChoice(choice: 1)
                        }
                        .frame(minWidth: 100, minHeight: 100)
                        .background(.regularMaterial)
                        .font(.system(size: 100))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                        
                        Button("✌🏼"){
                            // Scissor
                            userChoice(choice: 2)
                        }
                        .frame(minWidth: 100, minHeight: 100)
                        .background(.regularMaterial)
                        .font(.system(size: 100))
                        .clipShape(Capsule())
                        .shadow(radius: 5)
                    }
                    
                    
                    Spacer()
                }
                .frame(minWidth: 200, maxWidth: .infinity, minHeight: 200, maxHeight: 250)
                .background(Color(red: 0.4, green: 0.25, blue: 0.6))
                .clipShape(RoundedRectangle(cornerRadius: 50))
                
                Spacer()
            }
            .padding()
            .alert("What happened?",isPresented: $isShowMove){
                Button("Next Turn", action: nextTurn)
            } message: {
                Text("""
                You played \(userOptions[userChoice])
                Computer played \(counterOptions[compChoice])
                \(turnStatus)
                """)
            }
            .alert("Game Over", isPresented: $isGameOver){
                Button("Restart", action: resetGame)
            } message: {
                Text("You have played your 5 turns. It's time to restart the game.")
            }
        }
    }
    
    func userChoice(choice: Int){
        compChoice = Int.random(in: 0...2)
        userChoice = choice
        if userOptions[userChoice] == counterOptions[compChoice]{
            turnStatus = "It's a draw"
        }
        else if userChoice == compChoice{
            compScore += 1
            turnStatus = "Oops, you lost this round"
        }
        else {
            userScore += 1
            isturnWon = true
            turnStatus = "You won this round"
        }
        isShowMove = true
        turns += 1
    }
    
    func nextTurn(){
        isturnWon = false
        if turns >= 5{
            isGameOver = true
        }
    }
    
    func resetGame(){
        turns = 0
        userScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
