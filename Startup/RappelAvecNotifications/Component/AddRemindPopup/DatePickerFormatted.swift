//
//  DatePickerFormatted.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct DatePickerFormatted: View {
    @Binding var date: Date

    var dateFormatted: String {
        return formateDate()
    }
    
    var hoursFormatted: String {
        return formateHours()
    }

    func formateDate() -> String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        
        #if DEBUG
        dateFormatter.locale = Locale(identifier: "fr_FR")
        #endif

        dateFormatter.dateFormat = "LLLL"
        let month = dateFormatter.string(from: date)
        let day = calendar.component(.day, from: date)
        
        return "\(day) \(month)"
    }
    
    func formateHours() -> String {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return "\(hour)h\(minute - 9 < 0 ? "0\(minute)" : String(minute))"
    }
    
    var body: some View {
        HStack(spacing: 5) {
            Text("M'alerter le")
                .foregroundColor(Color(Colors.dark))
            .font(.custom("Roboto-Medium", size: 18))
            
            Text(dateFormatted).foregroundColor(Color(Colors.green)).font(.custom("Roboto-Bold", size: 20))
            
            Text("à").foregroundColor(Color(Colors.dark)).font(.custom("Roboto-Medium", size: 18))
            
            Text(hoursFormatted).foregroundColor(Color(Colors.blue)).font(.custom("Roboto-Bold", size: 20))
        }
    }
}

struct DatePickerFormatted_Previews: PreviewProvider {
    @State static var date: Date = Date()
    
    static var previews: some View {
        DatePickerFormatted(date: $date)
    }
}
