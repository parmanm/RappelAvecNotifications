//
//  NotificationHelper.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import Foundation
import NotificationCenter

class NotificationHelper {
    static func addLocalNotification(_ notification: NotificationModel) {
        // Création du contenu de la notification
        let content = UNMutableNotificationContent()
        
        content.title = "Rappelez-vous de"
        content.body = notification.message
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        //Formatter la date pour l'utiliser avec le Calendar et donc plannifier la notification
        let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: notification.plannedFor)
        
        // Création d'un trigger sur une Date qui va programmé la notification à la date notification.plannedFor
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        //Création de la requète avec le trigger (ici la date et l'heure du rappel) et le contenu (titre, message, ...)
        let request = UNNotificationRequest(identifier: "\(notification.id)", content: content, trigger: trigger)
        
        // Ajout de la notification sur l'iphone/l'ipad
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    static func removeLocalNotification(_ notification: NotificationModel) {
        //Suppression de la notification avec son id
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["\(notification.id)"])
    }
    
    static func removeAllDeliveredNotification() {
        
    }
}
