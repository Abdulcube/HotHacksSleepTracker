//
//  CircleImage.swift
//  HopHacks Input Application
//
//  Created by Abdulrahman Abdulrahman on 9/12/20.
//  Copyright © 2020 Abdulrahman Abdulrahman. All rights reserved.
//

import SwiftUI


struct CircleImage: View {
    
    var body: some View {
        VStack {
            Text("")
            Image("HopHacks").resizable()
                .imageScale(.small)
                .clipShape(Circle())
                .frame(width: 125, height: 125)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
