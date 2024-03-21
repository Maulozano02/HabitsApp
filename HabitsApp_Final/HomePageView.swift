//
//  HomePageView.swift
//  HabitsApp_Final
//
//  Created by Eugenia Ruiz Velasco Olvera on 20/03/24.
// :
// { }



import SwiftUI

struct HomePageView: View {
    var body: some View {
       
        VStack{
            HStack{
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                Text("Habits")
                    .foregroundColor(.purple)
                    .font(.title)
                
                Spacer()
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 10)
                    
            }
            HStack{
                
                Text("Tracker")
                    .underline()
                    .bold()
                Text("Report")
                    .underline()
            }
            HStack{
                VStack{
                    Text("Need improvment in Wednesday")
                    Text("Need improvment in Wednesday")
                    Text("Need improvment in Wednesday")
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 10)
                
            }
            
            .background(Color.purple)
            .padding()
    
            

            Text("Monthly Performance")
            MultiDatePicker(/*@START_MENU_TOKEN@*/"Label"/*@END_MENU_TOKEN@*/, selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Binding<Set<DateComponents>>@*/.constant([])/*@END_MENU_TOKEN@*/)
                .frame(width: 300, height: 600)
        }
        .padding()
        
        
    }
}

#Preview {
    HomePageView()
}
