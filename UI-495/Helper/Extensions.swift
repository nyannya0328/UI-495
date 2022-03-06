//
//  Extensions.swift
//  UI-495
//
//  Created by nyannyan0328 on 2022/03/06.
//

import SwiftUI

extension UISplitViewController{
    
    open override func viewDidLoad() {
        
        self.preferredDisplayMode = .twoOverSecondary
        self.preferredSplitBehavior = .displace
        self.preferredPrimaryColumnWidthFraction = 0.3
        
        NotificationCenter.default.addObserver(self, selector: #selector(UpadteView(notifi: )), name: NSNotification.Name("UPDATEFRACTION"), object: nil)
        
        
    }
    
    @objc
    func UpadteView(notifi : Notification){
        
        
        
        
        if let info = notifi.userInfo,let fraction = info["Fraction"] as? Double{
            
            
            self.preferredPrimaryColumnWidthFraction = fraction
            
        }
        
    }

    
    
}
