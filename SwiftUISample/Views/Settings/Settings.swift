//
//  Settings.swift
//  SwiftUISample
//
//  Created by Rinni Swift on 7/5/21.
//

import SwiftUI
import UIKit

let cardRatio = UIScreen.main.bounds.width / 2.2
let cardRadius = UIScreen.main.bounds.width / 25

struct Settings: View {
    var body: some View {
        VStack {
            Text("Hello, Rinni")
                .font(.largeTitle).bold()
            ScrollView(.horizontal, showsIndicators: false, content: {
                HStack {
                    ForEach(0..<15) {_ in
                        Text("Item")
                            .frame(width: cardRatio, height: cardRatio, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(cardRadius)

                    }
                }
            })
            Spacer()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
