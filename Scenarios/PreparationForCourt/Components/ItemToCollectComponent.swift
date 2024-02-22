//
//  SwiftUIView.swift
//
//
//  Created by Kirill Baranov on 19/02/24.
//

import SwiftUI

struct ItemToCollectComponent: View {
    
    @State private var isHovering = false
    
    let item: ItemToCollect
    
    var body: some View {
        VStack {
            if item.currentPlace == .leaveIt {
                
                VStack {
                    Image(systemName: item.id)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                    Text(item.title)
                }
                
            } else {
                
                HStack {
                    Image(systemName: item.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.title)
                                .bold()
                            if item.isCorrectPlace {
                                Image(systemName: "checkmark.circle")
                                    .foregroundStyle(.green)
                            } else {
                                Image(systemName: "x.circle")
                                    .foregroundStyle(.red)
                            }
                        }
                        Text(item.description)
//                            .frame(maxWidth: 220, alignment: .leading)
                            
                    }
                    
                }
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.thinMaterial)
                .shadow(radius: 1)
        }
        .draggable(item.title)

    }
}

#Preview {
    ItemToCollectComponent(item: ItemToCollect(
        id: "text.book.closed",
        title: "Law book",
        description: "For quick reference to legal statutes and precedents",
        currentPlace: .takeIt,
        correctPlace: .takeIt
    ))
}

