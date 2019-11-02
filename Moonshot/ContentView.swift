//
//  ContentView.swift
//  Moonshot
//
//  Created by Laurent B on 01/11/2019.
//  Copyright © 2019 Laurent B. All rights reserved.
//

import SwiftUI

struct Hike {
    let url: String
    init(url: String){
        self.url = url
    }
}

struct ContentView: View {
    let hike: Hike
    @State private var zoomed = false
    
    var body: some View {
        VStack {
            Image(hike.url)
            .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
            }
        } .navigationBarTitle(Text(hike.url))
    }
}
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView(hike: Hike(url: "Example"))
        }
}

