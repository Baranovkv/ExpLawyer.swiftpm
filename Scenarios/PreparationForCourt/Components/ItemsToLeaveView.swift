//
//  SwiftUIView.swift
//  
//
//  Created by Kirill Baranov on 20/02/24.
//

import SwiftUI

struct ItemsToLeaveView: View {
    
    @EnvironmentObject var preparationVM: PreparationVM
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                FlexibleStack(spacing: 10, alignment: .listRowSeparatorLeading) {
                    ForEach (preparationVM.items.filter( { $0.currentPlace == .leaveIt } )) { item in
                        ItemToCollectComponent(item: item)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .dropDestination(for: String.self, action: { itemNames, location in
            
            for itemName in itemNames {
                if let itemIndex = preparationVM.items.firstIndex(where: { $0.title == itemName } ) {
                    preparationVM.items[itemIndex].currentPlace = .leaveIt
                }
                
            }
            return true
            
        })
    }
}
