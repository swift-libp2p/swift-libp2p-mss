//
//  Application+MSS.swift
//  
//
//  Created by Brandon Toms on 6/23/22.
//

import LibP2P

extension Application.TransportUpgraders.Provider {
    public static var mss: Self {
        .init { app in
            app.transportUpgraders.use {
                MSS(application: $0)
            }
        }
    }
}
