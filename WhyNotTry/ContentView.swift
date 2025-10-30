//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Omkar Vijay Bagade on 30/10/25.
//

import SwiftUI

struct ContentView: View {
    var activities: [String] = ["Badminton", "Baseball", "Archery", "Run", "Climbing","Basketball","Boxing","Bowling","Cooldown","Dance","Fishing","Golf","Handball","Hiking","Jumprope","Pickleball"]
    var colors: [Color] = [.blue, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .red]

    @State private var selectedActivity = "Badminton"
    @State private var id = 1
    
    var body: some View {
        VStack {
            Text("Why not try ...")
                .font(Font.largeTitle.bold())
            
            Spacer()
            
            VStack{
                Circle()
                    .fill(colors.randomElement() ?? .red)
                    .padding()
                    .overlay(
                        Image(systemName: "figure.\(selectedActivity.lowercased())")
                            .font(.system(size: 100))
                            .foregroundColor(.white)
                    )
            
                Text("\(selectedActivity)")
                    .font(.title)
            }
            .transition(.scale)
            .id(id)
            
            Spacer()
            
            Button("Try Again"){
                withAnimation(.easeInOut(duration: 0.5)){
                    selectedActivity = activities.randomElement() ?? "Archery"
                    id += 1
                }
            }
            .buttonStyle(.glassProminent)
        }
    }
}

#Preview {
    ContentView()
}
