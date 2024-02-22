//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 19/02/24.
//

import SwiftUI

struct PreparationView: View {
    
    @Environment (\.dismiss) var dismiss
    @StateObject var preparationVM: PreparationVM
    @State private var gameCompleted = false
    
    private let gameTip = GameTip(title:Text("Drag items from this area to your briefcase and back."))
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Drag the items you will take with you to court into your briefcase.")
                    .font(.title3)
                HStack {
                    ItemsToLeaveView()
                        .frame(width: geometry.size.width * 0.5)
                        .popoverTip(gameTip)
                    Spacer()
                    ItemsToTakeView()
                        .frame(width: geometry.size.width * 0.5)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    preparationVM.saveResult()
                    gameCompleted.toggle()
                }, label: {
                    Text("Complete")
                        .padding(4)
                        .frame(width: 90)
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
                .disabled(!preparationVM.isResultsCorrect)

            }
        }
        .alert("Great job!", isPresented: $gameCompleted, actions: {
            Button("Continue") {
                dismiss()
            }
        }, message: {
            Text("Now you are ready for the court hearing!")
        })
        .navigationTitle("Prepare for court")
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(preparationVM)
    }
}
