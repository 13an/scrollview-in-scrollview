//
//  ContentView.swift
//  ScrollViewInScrollView
//
//  Created by 13an on 2024/11/22.
//

import SwiftUI

struct ContentView: View {
    var showCamera: Bool {
        pagingPosition == "camera"
    }
    @State var pagingPosition: String? = nil

    var body: some View {
        ScrollView {
            LazyVStack {
                Rectangle()
                    .fill(.red)
                    .frame(height: 720)
                    .id("camera")
                ScrollView {
                    VStack {
                        ForEach(0..<200) { index in
                            Rectangle()
                                .fill(.clear)
                                .padding(16)
                                .overlay {
                                    Text("\(index)")

                                }
                        }
                    }
                }
                .frame(height: 720)
                .id("album")
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $pagingPosition)
    }
}

#Preview {
    ContentView()
}
