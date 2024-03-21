//
//  ContentView.swift
//  HabitsApp
//
//  Created by alumno on 20/03/24.
//


import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false // New state to track password visibility
    
    var body: some View {
        //Here comes the  connection to pruebaVM = pruebaViewModel
        
        NavigationView{
            ZStack{
                
                VStack {
                    Image("LogoLogin")
                        .resizable()
                        .padding(10.0)
                        .frame(width: 285.0, height: 130.0)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    
                    VStack (alignment: .center, content: {
                        
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
                            .padding(7) // Adds some top padding around the TextField for better appearance
                            .overlay(
                                RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                    .stroke(Color.gray, lineWidth: 1) // Border color and width
                            )
                        
                        
                        HStack{
                            Text("Password").font(.subheadline).fontWeight(.medium)
                            Spacer()
                        }
                        .padding(.top, 10.0)
                        
                        
                        ZStack(alignment: .trailing) {
                            if showPassword {
                                TextField("Please enter your Password", text: $password)
                                    .font(.system(size: 14))
                                    .padding(7)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                            .stroke(Color.gray, lineWidth: 1) // Border color and width
                                    )
                            } else {
                                SecureField("Please enter your Password", text: $password)
                                    .font(.system(size: 14))
                                    .padding(7)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8) // Adjust corner radius as needed
                                            .stroke(Color.gray, lineWidth: 1) // Border color and width
                                    )
                            }
                            
                            Button(action: {
                                showPassword.toggle()
                            }) {
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                        
                        
                        
                        HStack{
                            Toggle(isOn: /*@PLACEHOLDER=Is On@*/.constant(true)) {
                                Text("Remember Me").font(.callout)
                            }
                            .toggleStyle(checkbox())
                            
                            .padding(.trailing, 90.0)
                            .padding(.top, 10)
                            
                            
                            Button("Forgot password") {
                                
                            }
                            .font(.callout)
                            .padding(.top, 10)
                        }
                        
                        NavigationLink(destination:HomePageView()){
                            Text("Login")
                                .padding(.horizontal, 150) // Adjust the horizontal padding to increase the width
                                .padding(.vertical, 15)    // Adjust the vertical padding to increase the height
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(hex: "C07390"), Color(hex: "A74AA3"), Color(hex: "7332A9"), Color(hex: "4D2599"), Color(hex: "36208A")]), startPoint: .leading, endPoint: .trailing)
                                )
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        .padding(.top,20)
                        .padding(.bottom, 120)
                        
                        HStack{
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 0.8)
                            Text(" or Log In with  ").font(.footnote).fontWeight(.light)
                                .foregroundColor(.gray) // Set text color to gray
                            Rectangle()
                                .fill(Color.gray)
                                .frame(height: 0.8)
                        }
                        .padding(.bottom, 10)
                        
                        
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5) // Adjust the corner radius as needed
                                    .stroke(Color.gray, lineWidth: 1) // Adjust the color and width of the border
                                    .frame(width: 173, height: 35) // Adjust the width and height of the rectangle
                                
                                HStack {
                                    Image("GoogleLogo")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20) // Adjust the size of the image as needed
                                    
                                    Text("Sign in with Google")
                                        .font(.system(size: 14))
                                        .padding(6)
                                }
                            }
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 5) // Adjust the corner radius as needed
                                    .stroke(Color.gray, lineWidth: 1) // Adjust the color and width of the border
                                    .frame(width: 173, height: 35) // Adjust the width and height of the rectangle
                                
                                HStack {
                                    Image(systemName: "applelogo") // Using SF Symbol for Apple logo
                                        .font(.system(size: 23))
                                        .padding(.leading, 6) // Adjust padding as needed
                                    
                                    Text("Sign in with Apple")
                                        .font(.system(size: 14))
                                        .padding(6)
                                }
                            }
                        }
                        .padding(.bottom, 40)
                        
                        HStack{
                            Text("Don't have an account?").font(.footnote).fontWeight(.light)
                                .foregroundColor(.gray) // Set text color to gray
                            Text("Sign Up").font(.footnote).fontWeight(.regular)
                                .foregroundColor(.purple) // Set text color to purple
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

