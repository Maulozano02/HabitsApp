import SwiftUI

struct HomePageView: View {
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    let dayCompleted = ["Sun", "Tue"]
    let dayToHighlight = "Thu"
    @State private var selectedDays: Set<Date> = []
    let daysInMonth = 30
    
    var body: some View {
        VStack {
            HStack {
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
            //.padding(.horizontal)
                    .padding(.top, 52)
            

            // Tu HStack con el fondo morado
            VStack(alignment: .leading, spacing:0) {
                Text("  Your Progress")
                    .font(.title)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        Image("progress1")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(6)
                        Image("progress2")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(6)
                        Image("progress3")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .padding(6)
                            }
                        }
                        .frame(height: 160) // Fijar un alto para el ScrollView

                    }
                    .frame(maxWidth: .infinity, maxHeight: 220, alignment: .topLeading)

            // Dashboard
            HStack(spacing: 0){
                Text("    Weekly Progress")
                    .foregroundColor(.purple)
                Spacer()
            }
            
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.929, green: 0.933, blue: 0.929))
                    .cornerRadius(8) // Adjust the corner radius as needed
                    .frame(height: 130) // Increase width and height
                

                HStack(spacing: 12) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        VStack {
                            Rectangle()
                                .fill(determineColor(for: day))
                                .frame(width: 40, height: day == dayToHighlight ? 70 : 60)
                                .cornerRadius(2)
                                        
                            Text(day)
                                .font(.system(size: day == dayToHighlight ? 20 : 15))
                                .fontWeight(day == dayToHighlight ? .bold : .regular)
                        }
                    }
                }
            }
                
            .padding(.bottom, 15)

            // Sección de rendimiento mensual
            HStack{
                Text("    Monthly Performance")
                    .foregroundColor(.purple)
                Spacer()
            }
            
            
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.929, green: 0.933, blue: 0.929))
                    .cornerRadius(8) // Adjust the corner radius as needed
                    .frame(height: 230) // Increase width and height
                
                VStack {
                    HStack(spacing: 40) {
                        ForEach(daysOfWeek, id: \.self) { day in
                            Text(String(day.first ?? " "))
                                .fontWeight(.bold)
                                .foregroundColor(.purple)
                        }
                    }

                    let columns = Array(repeating: GridItem(.flexible()), count: 7)

                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(0..<daysInMonth, id: \.self) { day in
                            Button(action: {
                                let today = Calendar.current.startOfDay(for: Date())
                                if let dayToAdd = Calendar.current.date(byAdding: .day, value: day, to: today) {
                                    if selectedDays.contains(dayToAdd) {
                                        selectedDays.remove(dayToAdd)
                                    } else {
                                        selectedDays.insert(dayToAdd)
                                    }
                                }
                            }) {
                                Text("\(day + 1)")
                                    .frame(width: 30, height: 30)
                                    .background(selectedDays.contains {
                                        Calendar.current.isDate($0, inSameDayAs: Calendar.current.date(byAdding: .day, value: day, to: Date())!)
                                    } ? Color.purple : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(25)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }



            }

            
        }
        .edgesIgnoringSafeArea(.top) // Ignora el área segura en la parte superior
    }

    func determineColor(for day: String) -> Color {
        if day == dayToHighlight {
            return Color(hex: "A74AA3")
        } else if dayCompleted.contains(day) {
            return Color(hex: "36208A")
        } else {
            return .gray // Un color por defecto si no se cumple ninguna condición
        }
    }
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
