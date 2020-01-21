//
//  RemindCheckbox.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct RemindCheckbox: View {
    @State var isChecked: Bool = false
    
    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }, label: {
            Image("tick_\(self.isChecked ? "checked" : "unchecked")").resizable()
        })
    }
}

struct RemindCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        RemindCheckbox()
    }
}
