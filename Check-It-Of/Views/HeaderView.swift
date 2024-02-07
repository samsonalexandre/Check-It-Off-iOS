//
//  HeaderView.swift
//  Check-It-Of
//
//  Created by Alexandre Samson on 07.02.24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.pink)
                .rotationEffect(Angle(degrees: 15))
            
            VStack {
                Text("Check-It-Of")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text("Aufgaben zu ende bringen")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
