//
//  HomeView.swift
//  RappelAvecNotifications
//
//  Created by Maxime Parmantier Cloiseau on 15/01/2020.
//  Copyright © 2020 RUN4U Studio. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State var isPopupOpen: Bool = false
    @State var reminds: [NotificationModel] = [NotificationModel]()

    var listHeight: CGFloat {
        self.reminds.count == 0 ? 80 : (CGFloat((self.reminds.count * 40)) + CGFloat((self.reminds.count * 25)) + 50)
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(Colors.green), Color(Colors.blue)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Mes rappels").font(.custom("Roboto-Medium", size: 32)).foregroundColor(Color(Colors.white)).padding(.trailing, 90.0)
                    
                    VStack(spacing: 25) {
                        if self.reminds.count < 1 {
                            Text("Aucun rappel pour le moment").font(.custom("Roboto-Regular", size: 14)).foregroundColor(Color(Colors.dark).opacity(0.60))
                        } else {
                            ForEach(self.reminds, id: \.self) { remind in
                                RemindRow(remind: remind, delete: { remind in
                                    self.reminds.removeAll { (rem) -> Bool in
                                        if remind.id == rem.id {
                                           //remove notif
                                        }
                                        return remind.id == rem.id
                                    }
                                })
                                    .frame(height: 40)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }.frame(width: 300, height: self.listHeight)
                    .background(Color.white)
                        .cornerRadius(20)
                        .padding(.top, 10)
                        
                    
                    Spacer()
                    
                    Button(action: {
                        self.isPopupOpen.toggle()
                    }, label: {
                        Image("Bouton_plus").resizable().frame(width: 96, height: 96).padding(.bottom)
                    })
                }.padding(.top, 50)
                
                if self.isPopupOpen {
                    ZStack {
                        BlurView(style: .dark).edgesIgnoringSafeArea(.all).animation(nil)
                        
                        VStack {
                            Spacer()
                            AddRemindPopupView(addRemind: { newRemind in
                                self.reminds.append(newRemind)
                                
                                //add notif
                            }, isOpen: self.$isPopupOpen).frame(width: geometry.size.width, height: 480).background(RoundedCorners(tl: 36/2, tr: 36 / 2, bl: 0, br: 0).fill(Color.white))
                            .animation(nil)
                                
                        }.edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
