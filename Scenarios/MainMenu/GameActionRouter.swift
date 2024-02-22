//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 11/02/24.
//

import SwiftUI

struct GameActionRouter: View {
    @EnvironmentObject var gameVM: GameVM
    
    @Environment(\.dismiss) var dismiss
    let action: GameAction
    @State var closeGame: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                switch action.id {
                case "paralegal_sorting":
                    PreparationView(preparationVM: PreparationVM(gameVM: gameVM))
                case "paralegal_drafting":
                    LoanAgreementView(loanAgreementVM: LoanAgreementVM(gameVM: gameVM))
                case "paralegal_research":
                    AnalyticsView(analyticsVM: AnalyticsVM(gameVM: gameVM))
                default:
                    Text("Error. Cannot download game for the action: \(action.id)")
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        closeGame.toggle()
                    } label: {
                        Text("Close")
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
                    }
                    .buttonStyle(.plain)
                    
                    .alert("You close the game. Your progress will not be saved", isPresented: $closeGame) {
                        Button("Close the game", role: .destructive) {
                            dismiss()
                        }
                        Button("Canсel", role: .cancel) {
                            
                        }
                    }
                }
            }
        }
    }
}

//#Preview {
//    GameActionRouter(action: .actions[0])
//}
