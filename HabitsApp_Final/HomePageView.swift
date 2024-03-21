import SwiftUI

struct HomePageView: View {
    let daysOfWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        let dayToHighlight = "Thu"
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
            
            // HStack con fondo morado
            HStack {
                VStack {
                    Text("Need improvement in Wednesday")
                    Text("Need improvement in Wednesday")
                    Text("Need improvement in Wednesday")
                }
                .foregroundColor(.white)
                .padding(10)
                
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(10)
            }
            .frame(maxWidth: .infinity) // Extiende al máximo ancho.
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(hex: "C07390"), Color(hex: "A74AA3"), Color(hex: "7332A9"), Color(hex: "4D2599"), Color(hex: "36208A")]), startPoint: .leading, endPoint: .trailing)
            )
            HStack {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .font(.system(size: day == dayToHighlight ? 20 : 15))
                        .fontWeight(day == dayToHighlight ? .bold : .regular)
                        .padding(.horizontal, 2)
                }
            }
                        .padding(.vertical, 10)


            Text("Monthly Performance")
                .padding(.horizontal) // Aplica padding horizontal a este Text

            // MultiDatePicker con su propio frame
            MultiDatePicker("Label", selection: .constant([]))
                .frame(width: 300, height: 600)
                .padding(.horizontal)
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

// Preview
struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

