//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 18/02/24.
//

import SwiftUI

struct AnalyticsView: View {
    
    @StateObject var analyticsVM: AnalyticsVM
    
    @State var showConfirmError = false    
    
    var body: some View {
        VStack {
            switch analyticsVM.testStage.rawValue {
                
            case 0:
                TestReadingView()
                
            case 1...4:
                QuestionView(questionIndex: analyticsVM.testStage.rawValue - 1)
                
            case 5:
                ResultsView()
                
            default:
                TestPreview()
            }
        }
        .frame(maxWidth: 700)
        .padding(32)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.thinMaterial)
        }
        .padding()
        .navigationBarTitle("Read the text and take a small test")
        .navigationBarTitleDisplayMode(.inline)
        .environmentObject(analyticsVM)
    }
}

#Preview {
    AnalyticsView(analyticsVM: AnalyticsVM(gameVM: GameVM()))
}
