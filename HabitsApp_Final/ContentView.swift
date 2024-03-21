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
        
        NavigationView{
            ZStack{
                
                VStack {
                    Image("LogoLogin")
                        .resizable()
                        .padding(10.0)
                        .frame(width: 285.0, height: 130.0)
                    
                    VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        HStack{
                            Text("Hi, Welcome Back! 👋").font(.title2).fontWeight(.semibold)
                            Spacer()
                        }
                        
                        
                        HStack{
                            Text("Hello again, you've been missed").font(.subheadline).foregroundColor(Color.gray)
                            Spacer()
                        }
                        
                        
                        HStack{
                            Text("Email").font(.subheadline).fontWeight(.medium)
                            Spacer()
                        }
                        .padding(.top, 20.0) // Adds some top padding around the Text for better appearance
                        
                        
                        TextField("Please enter your Email", text: .constant(""))
                            .font(.system(size: 14)) // Adjust the size as per your requirement
                            .padding(4) // Adds some top padding around the TextField for better appearance
                            .border(Color.gray) // Optionally, add a border to make the TextField visible
                        
                        
                        HStack{
                            Text("Password").font(.subheadline).fontWeight(.medium)
                            Spacer()
                        }
                        .padding(.top, 10.0)
                        
                        TextField("Please enter your Password", text: .constant(""))
                            .font(.system(size: 14)) // Adjust the size as per your requirement
                            .padding(4) // Adds some top padding around the TextField for better appearance
                            .border(Color.gray) // Optionally, add a border to make the TextField visible
                        
                        
                        
                        HStack{
                            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                                Text("Remember Me").font(.callout)
                            }
                            .toggleStyle(checkbox())
                            
                            .padding(.trailing, 80.0)
                            .padding(.top, 10)
                            
                            
                            Button("Forgot password") {
                                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                            }
                            .font(.callout)
                            .padding(.top, 10)
                        }
                        NavigationLink(destination:HomePageView()){
                            Text("Login")
                                .padding(15)
                                .background(Color.purple)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        
                    })
                }
                .padding()
            }
            
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

