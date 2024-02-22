//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 18/02/24.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var analyticsVM : AnalyticsVM
    let questionIndex: Int
    
    var body: some View {
        
        VStack(alignment:.leading) {
            Text("Based on the text you read, choose one of the answer options that corresponds to the statement:")
            Text(analyticsVM.testQuestions[questionIndex].content)
                .font(.title3)
                .padding()
                .overlay(
                    Rectangle()
                        .frame(width: 4, height: nil, alignment: .leading)
                        .foregroundColor(Color.primary),
                    alignment: .leading
                )
                .padding(.vertical)
            
            ForEach (TestAnswer.allCases, id: \.self) { answer in
                Button(action: {
                    analyticsVM.testQuestions[questionIndex].playerAnswer = answer
                }, label: {
                    HStack {
                        Text(answer.rawValue)
                        Spacer()
                        if analyticsVM.testQuestions[questionIndex].playerAnswer == answer {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundStyle(.gray)
                        }
                        
                    }
                    .padding()
                    .frame(width: 250, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(.thinMaterial)
                            .shadow(radius: 4)
                    }
                })
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity)
            }
        }
        
        HStack {
            if (questionIndex != 0) {
                Button(action: {
                    
                    analyticsVM.testStage.previous()
                    
                }, label: {
                    Text("Previous")
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .frame(width: 100)
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
            
            Button(action: {
                
                analyticsVM.testStage.next()
                if questionIndex == 3 {
                    
                }
                
            }, label: {
                Text(questionIndex != 3 ? "Next" : "Finish")
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .frame(width: 100)
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
        .padding(.top)
    }
}

//#Preview {
//    QuestionView()
//}
