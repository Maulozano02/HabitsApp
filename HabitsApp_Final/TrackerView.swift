import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
}

struct TrackerView: View {
    @State private var activities = [
        Activity(title: "Study", subtitle: "Study for 2 hours to improve grades"),
        Activity(title: "Water", subtitle: "Drink 2 liters of water every 4 hours"),
        Activity(title: "Sleep", subtitle: "Sleep for 7 hours"),
        Activity(title: "Meditate", subtitle: "Meditate for 15 minutes every morning")
    ]
    
    @State private var selectedActivity: Activity? = nil

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

            HStack {
                // Espacio reservado para el gráfico de pie
                Rectangle()
                    .fill(Color.clear) // Relleno transparente para mostrar tu imagen después
                    .frame(width: 100, height: 100) // Tamaño para tu imagen del gráfico de pie
                    .border(Color.gray) // Borde para visualizar el área
                
                Text("Your Progress")
                    .font(.title)
                    .padding([.leading, .top])
            }
            .padding(.vertical, 30)
            
            ForEach(activities) { activity in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(activity.title)
                            .font(.headline)
                        Text(activity.subtitle)
                            .font(.subheadline)
                    }
                    .padding()
                    .background(Rectangle().fill(Color.gray.opacity(0.2)))
                    .cornerRadius(8)
                    .onTapGesture {
                        self.selectedActivity = activity
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            
            Spacer()
        }
        .sheet(item: $selectedActivity) { activity in
            ActivityDetailView(activity: activity)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct ActivityDetailView: View {
    let activity: Activity

    var body: some View {
        VStack {
            Text(activity.title)
                .font(.largeTitle)
                .padding()
            
            Text(activity.subtitle)
                .font(.title)
                .padding()
            
            Spacer()
        }
    }
}

// Asegúrate de que Activity cumple con Equatable para usarlo con .sheet(item:)
extension Activity: Equatable {
    static func == (lhs: Activity, rhs: Activity) -> Bool {
        lhs.id == rhs.id
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
