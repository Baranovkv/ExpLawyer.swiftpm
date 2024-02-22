//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 22/02/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var gameVM: GameVM
    @State private var currentActionIndex = 0

    var body: some View {
        
        VStack {
            GameActionPreview(action: gameVM.actions[currentActionIndex])
                
            HStack {
                ForEach (0..<3) { index in
                    
                    Button {
                        withAnimation {
                            currentActionIndex = index
                        }
                    } label: {
                        
                        VStack {
                            VStack {
                                Image(systemName: gameVM.actions[index].iconName)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.primary)
                                Text(gameVM.actions[index].shortTitle)
                                
                            }
                            .padding(16)
                            
                        }
                        .frame(width: currentActionIndex == index ? 175 : 125, height: currentActionIndex == index ? 175 : 125)
                        .background{
                            RoundedRectangle(cornerRadius: 16)
                                .shadow(radius: 4)
                                .foregroundStyle(.ultraThickMaterial)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(gameVM.actions[index].isCompleted ? .green : .gray, lineWidth: 2)
                        }
                    }
                    .buttonStyle(.plain)
                    
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}
