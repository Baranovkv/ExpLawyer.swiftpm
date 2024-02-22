//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 20/02/24.
//

import SwiftUI

struct ItemsToTakeView: View {
    
    @EnvironmentObject var preparationVM : PreparationVM
    
    var body: some View {
            
            VStack {
                
                HStack {
                    Image(systemName: "bag")
                        .font(.title)
                    Text("Briefcase")
                        .font(.title)
                }

                VStack {
                    ScrollView {
                        FlexibleStack(alignment: .leading) {
                            ForEach (preparationVM.items.filter( { $0.currentPlace == .takeIt }).sorted(by: { $0.priority > $1.priority })) { item in
                                ItemToCollectComponent(item: item)
                            }
                        }
                    }
                }
                .padding()
                .frame(maxHeight: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundStyle(.primary)
                        .opacity(0.5)
                }
                .dropDestination(for: String.self, action: { itemNames, location in
                    
                    for itemName in itemNames {
                        let priority = preparationVM.items.filter( { $0.currentPlace == .takeIt} ).count
                        if let itemIndex = preparationVM.items.firstIndex(where: { $0.title == itemName } ) {
                            preparationVM.items[itemIndex].currentPlace = .takeIt
                            preparationVM.items[itemIndex].priority = priority

                        }
                        
                    }
                    return true
                    
                })
                
                Spacer()
            }
            .padding()
    }
}

//#Preview {
//    ItemsDestinationView()
//}
