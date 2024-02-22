//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI

struct GameActionPreview: View {
    
    let action: GameAction
    @State private var gameStarted = false
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: action.iconName)
                        .foregroundStyle(.primary)
                        .font(.title)
                    Text(action.title)
                        .font(.title)
                }
                .padding(.vertical)
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 4, alignment: .bottom)
                        .foregroundColor(Color.primary),
                    alignment: .bottom)
                .padding(.horizontal)
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    ForEach (action.description, id: \.self) { text in
                        HStack {
                            Text(text)
                                .font(.title3)
                                .padding()
                            Spacer()
                        }
                    }
                }
                
                .frame(maxWidth: .infinity)
                
                Spacer()
                
            }
            .frame(minWidth: 500, maxWidth: geometry.size.width * 0.7)
            
            HStack(alignment: .bottom) {
                Spacer()
                
                VStack(alignment: .trailing) {
                    Spacer()
                    Button(action: {
                        gameStarted.toggle()
                    }, label: {
                        Text("Start")
                            .padding()
                            .frame(width: 100, height: 75)
                            .foregroundStyle(.primary)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.ultraThickMaterial)
                                    .shadow(radius: 4)
                                
                            }
                            .overlay {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke()
                                    .foregroundStyle(.gray)
                            }
                    })
                    .buttonStyle(.plain)
                    .padding(.bottom, 64)
                    .padding(.trailing, 64)
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .fullScreenCover(isPresented: $gameStarted, content: {
            GameActionRouter(action: action)
        })
        
    }
}
