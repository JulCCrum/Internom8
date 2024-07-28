//
//  DashboardView.swift
//  Internom8
//
//  Created by chase Crummedyo on 7/28/24.
//

import SwiftUI

struct MainDashboardView: View {
    @State private var expandedSection: String?

    var body: some View {
        ZStack {
            Color(hex: "14181B").edgesIgnoringSafeArea(.all) // Dark mode background
            
            VStack(spacing: 20) {
                Text("Your STAR")
                    .font(.custom("RobotoMono-Bold", size: 24))
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                ScrollView {
                    VStack(spacing: 15) {
                        sectionView(title: "Situation", content: situationContent)
                        sectionView(title: "Task", content: "Tasks we'll do together")
                        sectionView(title: "Action", content: "Actionable steps")
                        sectionView(title: "Results", content: "Expected results")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    func sectionView(title: String, content: String) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: {
                withAnimation {
                    if expandedSection == title {
                        expandedSection = nil
                    } else {
                        expandedSection = title
                    }
                }
            }) {
                HStack {
                    Text(title)
                        .font(.custom("RobotoMono-Bold", size: 18))
                        .foregroundColor(Color(hex: "00a724"))
                    Spacer()
                    Image(systemName: expandedSection == title ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color(hex: "1d2428"))
                }
            }
            .padding(.vertical, 10)
            
            if expandedSection == title {
                Text(content)
                    .font(.custom("RobotoMono-Regular", size: 14))
                    .foregroundColor(Color(hex: "1d2428")) // Light gray text
                    .padding(.top, 8)
            }
        }
        .padding(.horizontal)
        .background(Color(hex: "1d2428"))
        .cornerRadius(8)
    }
    
    var situationContent: String {
        """
        3 internship offers for next summer:
        - New York City, NY ($45/hr)
        - Phoenix, AZ ($38/hr)
        - Remote from Houston, TX ($33)

        You currently make $2,300/month, paying
        $1,200/month for rent
        """
    }
}

// Keep the Color extension for hex colors here

struct MainDashboardView_Previews: PreviewProvider {
    static var previews: some View {
        MainDashboardView()
    }
}
