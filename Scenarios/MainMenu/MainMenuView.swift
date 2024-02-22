//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI

struct MainMenuView: View {
    
    @EnvironmentObject var gameVM: GameVM
    
    @State private var currentActionIndex = 0
        
    var body: some View {
        VStack {
            GeometryReader { geometry in
                HStack(alignment: .top, spacing: 4) {
                    
                    //MARK: NavigationView
                    ZStack {
                        VStack(alignment: .center) {
                            VStack(spacing: 0) {
                                Color.primary
                                ReverseTriangle()
                                    .foregroundStyle(.primary)
                                    .frame(height: 50)
                            }
                            .frame(width: 100, height: geometry.size.height * 0.05 + 50)
                            
                            LawyerScales()
                                .foregroundStyle(.primary)
                                .padding()
                                .frame(width: 125, height: 125)
                            
                                .background {
                                    Rectangle()
                                        .stroke(lineWidth: 5)
                                        .foregroundStyle(.primary)
                                        .rotationEffect(.degrees(45))
                                }
                            
                            VStack(spacing: 0) {
                                ReverseTriangle()
                                    .rotation(.degrees(180))                                  .foregroundStyle(.primary)
                                
                                    .frame(height: 50)
                                
                                Color.primary
                            }
                            .frame(width: 100)
                            
                        }
                        
                        .ignoresSafeArea()
                        
                        VStack {
                            Spacer()
                            
                            Spacer()
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
                            Spacer()
                        }
                    }
                    .frame(width: geometry.size.width * 0.3)
                    
                    //MARK: ActionPreview
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Explore the Lawyer's profession")
                                .padding(.top, geometry.size.height * 0.05)
                                .font(.largeTitle)
                            Text("Let's get acquainted with the daily activities of a lawyer")
                        }
                        .padding(.horizontal)
                        .padding(.top, 16)
                        .frame(width: geometry.size.width * 0.5, alignment: .leading)
                        .padding(.bottom, geometry.size.height * 0.1)
                        GameActionPreview(action: gameVM.actions[currentActionIndex])
                    }
                    .frame(width: geometry.size.width * 0.7)
                }
            }
//            .frame(maxWidth: 1280)
        }
        .frame(maxWidth: .infinity)
        .background {
            ZStack {
                Image(gameVM.actions[currentActionIndex].id)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.35)
                    .mask(
                        LinearGradient(gradient: Gradient(colors: [Color.black, Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
                    )
            }
                .ignoresSafeArea()
        }
        
    }
}

#Preview {
    MainMenuView()
}

