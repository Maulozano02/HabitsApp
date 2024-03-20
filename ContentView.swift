//
//  ContentView.swift
//  Pruebas
//
//  Created by alumno on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Here comes the  connection to pruebaVM = pruebaViewModel
        
        ZStack{
           
            VStack {
                Image("habitlogo")
                .resizable()
                
                VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                    Text("H A B I T S").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    

                    
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
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                            .padding() // Adds some padding around the TextField for better appearance
                            .border(Color.gray) // Optionally, add a border to make the TextField visible
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
