//
//  HomeScreen.swift
//  Animations
//
//  Created by Karavella on 04/08/22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var half = false
    @State private var dim = false
    
    @State var play = true
    
    var body: some View {
        TabView {
            VStack{
                Image("tower")
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(half ? 0.5 : 1.0)
                    .opacity(dim ? 0.5 : 1.0)
                    .onTapGesture {
                        self.half.toggle()
                        
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.dim.toggle()
                        }
                    }
            }.tabItem {
                Image(systemName: "clock")
                Text("Local animation")
            }.tag(0)
            
            VStack{
                LottieView(fileName: "logo", isEnabled: self.play)
                    .frame(width: 200, height: 200, alignment: .center)
               
                Button {
                    self.play.toggle()
                } label: {
                    Text(self.play ? "Click (Running...)" : "Click (Stopped!!!)")
                }

                
                
                
                
            }.tabItem {
                Image(systemName: "clock")
                Text("Lotte animation")
            }.tag(1)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
