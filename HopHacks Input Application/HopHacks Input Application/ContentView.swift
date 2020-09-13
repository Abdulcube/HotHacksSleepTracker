//
//  ContentView.swift
//  HopHacks Input Application
//
//  Created by Abdulrahman Abdulrahman on 9/12/20.
//  Copyright © 2020 Abdulrahman Abdulrahman. All rights reserved.
//

import SwiftUI
import Firebase
struct ContentView: View {
    @State private var uid = ""
    @State private var date = ""
    @State private var Hours = ""
    @State private var snooze = ""
    @State private var selectedDate = Date()
    var ref: DatabaseReference! = Database.database().reference().child("users")
    
    var dateFormatter: DateFormatter {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
            VStack (alignment: .center, spacing: 20){
                HStack {
                    CircleImage()
                    Spacer()
                    TextField(" Input UserID", text: $uid)
                        .frame(width: 225, height: 50)
                        
                        .foregroundColor(.gray)
                        .background(Color.white).clipShape(Rectangle())
                    .cornerRadius(5)
                        
                    
                }
                TextField(" What is today's Date?", text: $date)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 50)
                    .padding()
                TextField(" How many hours did you sleep?", text: $Hours)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 50)
                    .padding()
                TextField(" How many times did you hit snooze?", text: $snooze)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350, height: 50)
                    .padding()
                
                
                
                
                /*DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {
                    Text("")
                }.padding(30)*/
                /*Text("Turtle Rock")
                    //.font(.title)
                    .foregroundColor(.blue)
                Text("Joshua Tree National Park")
                    .font(.subheadline)*/
                Button(action: {
                    print("button tapped!")
                   
                    let values = ["Input Date" : self.date, "Hours Slept" : self.Hours, "Number of Snoozes" : self.snooze]
                    self.ref.child("uid").child(self.uid).updateChildValues(values, withCompletionBlock: {(err,ref) in
                        if err != nil {
                            print("not successfull")
                            
                        } else {
                             
                        }
                    })
                }) {
                    
                    ZStack {
                        Image("submit")
                            .font(.largeTitle)
                        Text("Submit")
                            .foregroundColor(.white)
                            .font(.title)
                        
                    }
                }
                
            }.padding()
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
