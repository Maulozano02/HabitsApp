//
//  TabView.swift
//  HabitsApp_Final
//
//  Created by Eugenia Ruiz Velasco Olvera on 21/03/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {

            TabView{
                HomePageView()
                    .tabItem {
                        Label("Report", systemImage: "chart.bar.xaxis.ascending.badge.clock")
                    }
                TrackerView()
                    .tabItem {
                        Label("Tracker", systemImage: "waveform.path.ecg.rectangle")
                    }
                UserView()
                    .tabItem {
                        Label("User", systemImage: "person.fill")
                    }
            }
    }
}

#Preview {
    MainView()
}
