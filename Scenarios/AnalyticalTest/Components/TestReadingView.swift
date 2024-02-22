//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 19/02/24.
//

import SwiftUI

struct TestReadingView: View {
    
    @EnvironmentObject var analyticsVM : AnalyticsVM
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View  {
        VStack {
            Text(analyticsVM.text)
                .font(.title2)
            ZStack {
                HStack {
                    VStack {
                        Image(systemName: "timer")
                            .resizable()
                            .scaledToFit()
                        Text(analyticsVM.timeLeft, format: .number)
                            .font(.title2)
                    }
                    .frame(width: 32)
                    Spacer()
                }
                .padding()
                
                Button(action: {
                    
                    analyticsVM.testStage.next()
                    
                }, label: {
                    Text("Answer Questions")
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .foregroundStyle(.primary)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundStyle(.ultraThickMaterial)
                                .shadow(radius: 4)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke()
                                .foregroundStyle(.gray)
                        }
                })
                .buttonStyle(.plain)
            }
            
        }
        .onReceive(timer, perform: { time in
            if analyticsVM.timeLeft == 0 {
                timer.upstream.connect().cancel()
                analyticsVM.testStage.next()
            }
            analyticsVM.timeLeft -= 1
        })
    }
}
