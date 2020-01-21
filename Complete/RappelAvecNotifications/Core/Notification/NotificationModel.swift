//
//  NotificationModel.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import Foundation

struct NotificationModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let message: String
    let plannedFor: Date
}
