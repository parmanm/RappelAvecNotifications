//
//  AddRemindPopupView.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct AddRemindPopupView: View {
    @State var remindName: String = ""
    @State var remindDate: Date = Date()
    @State var addRemind: (NotificationModel)->()
    @Binding var isOpen: Bool
    
    func createNewRemind() {
        if !self.remindName.isEmpty {
            let newRemind = NotificationModel(title: "Rappelez-vous de", message: self.remindName, plannedFor: self.remindDate)

            self.addRemind(newRemind)
            self.isOpen.toggle()
        }
    }

    var body: some View {
        VStack {
            Text("Ajouter un rappel")
                .foregroundColor(Color(Colors.blueText))
            .font(.custom("Roboto-Medium", size: 16))
            
            TextField("Nom du rappel", text: self.$remindName)
                .frame(width: 230, height: 36, alignment: .center)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(Colors.dark))
                .font(.custom("Roboto-Regular", size: 16))
                .overlay(RoundedRectangle(cornerRadius: 36 / 2).stroke().foregroundColor(Color(Colors.dark)))
            
            DatePickerFormatted(date: self.$remindDate)
            
            DatePicker(selection: self.$remindDate, in: Date()...,  displayedComponents: [.hourAndMinute, .date], label: {
                Text("date")
                }).labelsHidden()
            
            AddRemindButton(action: {
                self.createNewRemind()
            }).font(.custom("Roboto-Medium", size: 15))
            
            Button(action: {
                self.isOpen.toggle()
            }, label: {
                Image("stop")
            })
            
            Spacer()
        }
            .padding(.vertical, 20)
    }
}

struct AddRemindPopupView_Previews: PreviewProvider {
    @State static var isOpen: Bool = true
    
    static var previews: some View {
        AddRemindPopupView(addRemind: { _ in
            print("added")
        }, isOpen: $isOpen)
    }
}
