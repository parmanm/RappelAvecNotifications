//
//  RemindRow.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct RemindRow: View {
    @State var remind: NotificationModel
    @State var delete: (NotificationModel)->()

    var body: some View {
        VStack(spacing: 6) {
            HStack {
                RemindCheckbox().frame(width: 30, height: 30).padding(.leading)
                
                Text("\(self.remind.message)").foregroundColor(Color(Colors.dark)).font(.custom("Roboto-Medium", size: 18)).padding(.leading, 6)
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("14/22").foregroundColor(Color(Colors.dark)).font(.custom("Roboto-Medium", size: 14))
                    
                    Text("14h00").foregroundColor(Color(Colors.blue)).font(.custom("Roboto-Bold", size: 16))
                }.padding(.trailing, 5)
                
                Button(action: {
                    self.delete(self.remind)
                }, label: {
                    Image("delete").resizable().frame(width: 20, height: 20)
                }).padding(.trailing)
            }
            
            RoundedRectangle(cornerRadius: 1)
                .fill(Color(Colors.line))
                .frame(height: 1)
                .padding(.horizontal, 25)
        }
    }
}

struct RemindRow_Previews: PreviewProvider {
    @State static var remind: NotificationModel = NotificationModel(title: "test", message: "test", plannedFor: Date())
    
    static var previews: some View {
        RemindRow(remind: remind, delete: { remind in
            
        })
    }
}
