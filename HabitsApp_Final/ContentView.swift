//
//  ContentView.swift
//  HabitsApp
//
//  Created by alumno on 20/03/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        //Here comes the  connection to pruebaVM = pruebaViewModel
        
        ZStack{
           
            VStack {
                Image("LogoLogin")
                .resizable()
                .padding(10.0)
                .frame(width: 330.0, height: 150.0)
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    Text("H A B I T S").font(.title)
                    
                    

                    
                    VStack{
                        Text("Email").font(.subheadline)
                       
                        TextField("Please enter your Email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding() // Adds some padding around the TextField for better appearance
                            .border(Color.gray) // Optionally, add a border to make the TextField visible
                    }
                    
                    VStack{
                        Text("Password").font(.subheadline)
                       
                        TextField("Please enter your Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            .padding() // Adds some padding around the TextField for better appearance
                            .border(Color.gray) // Optionally, add a border to make the TextField visible
                    }
                    
                    HStack{
                        Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        Text("Remember Me")
                        }
                        .toggleStyle(checkbox())
                        
                        Button("Forgot password") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                    }

                    VStack{
                        Button("Login") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/ //NavigationView: Destination
                            
                            
                        }
                            .padding(15)
                            .background(Color.purple) // Optionally, add a border to make the TextField visible
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                    })
                        }
                .padding()
            }
            
        }
        
    }


struct checkbox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            
            Spacer()
            
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}

