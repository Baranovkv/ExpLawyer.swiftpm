//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 19/02/24.
//

import SwiftUI

struct TestPreview: View {
    @EnvironmentObject var analyticsVM : AnalyticsVM

    var body: some View {
        VStack(spacing: 10) {
            Text("""
You have \(analyticsVM.timeLeft) seconds to read a short text, during which you will be asked to answer \(analyticsVM.testQuestions.count) questions about whether the statements are true, false, or not mentioned in the text at all.
If you happen to answer the questions before the timer runs out, click the 'Answer Questions' button.
""")
            
            Button(action: {
                
                analyticsVM.testStage.next()
                
            }, label: {
                Text("Start test")
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
}
