//
//  CustomBackgroundView.swift
//  Hike
//
//  Created by bui khac lam on 15/07/2023.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: -3. DEPT
            Color.customGreenDart
                .cornerRadius(40)
                .offset(y:12)
            // MARK: -2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y:3)
            // MARK: -1. SURFACE
            LinearGradient(colors: [.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                .cornerRadius(40)
        }
        
    }
}

struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
