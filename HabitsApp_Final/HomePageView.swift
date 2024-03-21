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
            .padding(.horizontal)
                    .padding(.top, 50)
            

            // Tu HStack con el fondo morado
            HStack {
                VStack {
                    Text("Need more sleep                            ")
                    Spacer()
                    Text("Stay hydrated                                 ")
                    Spacer()
                    Text("Study is the most strong habit     ")
                }
                .foregroundColor(.white)
                .padding(.vertical, 40)
                .padding(.horizontal, 10)
                
                Spacer()
                VStack {
                    Text("50%")
                    Spacer()
                    Text("20%")
                    Spacer()
                    Text("100%")
                }
                .foregroundColor(.white)
                .padding(.vertical, 40)
                .padding(.horizontal, 10)
            }
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "C07390"), Color(hex: "A74AA3"), Color(hex: "7332A9"), Color(hex: "4D2599"), Color(hex: "36208A")]), startPoint: .leading, endPoint: .trailing)
            )

            // Dashboard
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
            .padding(.vertical, 30)

            // Sección de rendimiento mensual
            Text("Monthly Performance")
                .foregroundColor(.purple)
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 20) {
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
                            .frame(width: 35, height: 35)
                            .background(selectedDays.contains {
                                Calendar.current.isDate($0, inSameDayAs: Calendar.current.date(byAdding: .day, value: day, to: Date())!)
                            } ? Color.purple : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                }
            }
            Spacer()
            .padding(.horizontal)
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
