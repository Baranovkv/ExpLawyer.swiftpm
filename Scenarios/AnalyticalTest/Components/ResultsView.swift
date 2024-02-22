//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 19/02/24.
//

import SwiftUI

struct ResultsView: View {
    
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var analyticsVM : AnalyticsVM
    @State var gameCompleted = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Results")
                    .padding(.horizontal)
                    .font(.title3)
                    .overlay(
                        Rectangle()
                            .frame(width: 4, height: nil, alignment: .leading)
                            .foregroundColor(Color.primary),
                        alignment: .leading
                    )
                
                Text(analyticsVM.text)
                
                Text("Questions and answers:")
                
                    .padding(.horizontal)
                    .overlay(
                        Rectangle()
                            .frame(width: 4, height: nil, alignment: .leading)
                            .foregroundColor(Color.primary),
                        alignment: .leading
                    )
                    .padding(.vertical)
                
                ForEach (analyticsVM.testQuestions) { question in
                    VStack(alignment: .leading) {
                        
                        Text(question.content)
                        
                        VStack(alignment: .leading) {
                            
                            if !question.isCorrectAnswer {
                                HStack {
                                    if let answer = question.playerAnswer {
                                        Text("Your answer")
                                            .bold()
                                        HStack {
                                            Text(answer.rawValue)
                                            Image(systemName: "x.circle")
                                                .foregroundStyle(.red)
                                        }
                                        .padding(8)
                                        .background {
                                            RoundedRectangle(cornerRadius: 16)
                                                .foregroundStyle(.thinMaterial)
                                                .shadow(radius: 4)
                                        }
                                        Text("is not correct.")
                                            .bold()
                                    } else {
                                        Text("You have no answer.")
                                            .padding(.top, 8)
                                            .bold()
                                    }
                                }
                                HStack {
                                    Text("Correct answer is")
                                    HStack {
                                        Text(question.rightAnswer.rawValue)
                                        Image(systemName: "checkmark.circle")
                                            .foregroundStyle(.green)
                                        
                                    }
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(.thinMaterial)
                                            .shadow(radius: 4)
                                    }
                                }
                            } else {
                                HStack {
                                    Text("Your answer")
                                        .bold()
                                    HStack {
                                        Text(question.rightAnswer.rawValue)
                                        Image(systemName: "checkmark.circle")
                                            .foregroundStyle(.green)
                                    }
                                    .padding(8)
                                    .background {
                                        RoundedRectangle(cornerRadius: 16)
                                            .foregroundStyle(.thinMaterial)
                                            .shadow(radius: 4)
                                    }
                                    Text("is correct.")
                                        .bold()
                                }
                            }

                        }
                        
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke()
                            .foregroundStyle(.primary)
                    }
                }
            }
            .padding(.bottom)
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    analyticsVM.saveResult()
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

            }
        }
        .alert("Great job!", isPresented: $gameCompleted, actions: {
            Button("Continue") {
                dismiss()
            }
        }, message: {
            Text(analyticsVM.isResultsCorrect ? "You have excellent analytical skills!" : "You did well, but you can try again to get the perfect result!")
        })
    }
    
}
