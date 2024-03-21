//
//  UserView.swift
//  HabitsApp_Final
//
//  Created by Eugenia Ruiz Velasco Olvera on 21/03/24.
//
import SwiftUI

struct UserView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
                Rectangle()
                    .foregroundColor(.purple)
                    .frame(height: 150)
                    .edgesIgnoringSafeArea(.top)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 20)
                    
            Spacer().frame(height:0)
            Image("user")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .shadow(radius: 10)
            
            VStack {
                Text("Mauricio Lozano")
                    .font(.title)
                    .fontWeight(.medium)
                
                Text("Quiero mejorar mis hábitos para lograr un impacto más positivo en mi vida")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        DetailView(label: "Name", value: "Mauricio Lozano")
                        DetailView(label: "Phone", value: "8110491181")
                        DetailView(label: "Birthday", value: "10/01/2000")
                        DetailView(label: "Instagram", value: "MLoz")
                        DetailView(label: "Email", value: "Mau_loz@mail.com")
                        DetailView(label: "Password", value: "********")
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,100)
                }
                
                Button("Editar Perfil") { }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                    .padding(.bottom, 60)
            }
            .padding(.top,160)
        }
    }
}

struct DetailView: View {
    let label: String
    let value: String
    
    var body: some View {
        
        HStack {
            Text(label + ":")
                .bold()
                .frame(width: 100, alignment: .leading)
            Text(value)
                .frame(alignment: .leading)
        }
    }
}

#Preview {
    UserView()
}
