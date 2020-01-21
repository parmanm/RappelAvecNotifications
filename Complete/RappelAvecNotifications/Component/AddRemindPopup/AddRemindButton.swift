//
//  AddRemindButton.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct AddRemindButton: View {
    @State var action: (()->())?
    
    var body: some View {
        Button(action: {
            if self.action != nil {
                self.action!()
            }
        }, label: {
            Text("Ajouter le rappel")
        }).frame(width: 170, height: 36, alignment: .center)
            .foregroundColor(Color(Colors.white))
            .background(LinearGradient(gradient: Gradient(colors: [Color(Colors.green), Color(Colors.blue)]), startPoint: .leading, endPoint: .trailing))
        .cornerRadius(36 / 2)
            
    }
}

struct AddRemindButton_Previews: PreviewProvider {
    static var previews: some View {
        AddRemindButton(action: {
            print("hello")
        })
    }
}
