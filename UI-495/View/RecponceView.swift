//
//  RecponceView.swift
//  UI-495
//
//  Created by nyannyan0328 on 2022/03/06.
//

import SwiftUI

struct RecponceView<Content : View>: View {
    
    var content : (Properties) -> Content
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            let isRandScape = (size.width > size.height)
            
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            
            
            content(Properties(isRandScape: isRandScape, isIpad: isIpad, isSprit: isSplit(), size: size))
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear {
                    
                    
                    updateNotification(fraction: isRandScape && isSplit() ? 0.3 : 0.5)
                    
                }
                .onChange(of: isSplit(), perform: { newValue in
                    
                    
                    updateNotification(fraction: newValue && isSplit() ? 0.3 : 0.5)
               
                    
                })
                .onChange(of: isRandScape) { newValue in
                    
                    updateNotification(fraction: newValue && isSplit() ? 0.3 : 0.5)
                    
                }
            
            
        }
    }
    
    func updateNotification(fraction : Double){
        
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATEFRACTION"), object: nil,userInfo: [
        
        
            "Fraction" : fraction
        
        
        ])
    }
    
    func isSplit()->Bool{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return false
        }
        
        return screen.windows.first?.frame.size != screen.windows.first?.frame.size
    }
}


struct Properties{
    
    var isRandScape : Bool
    var isIpad : Bool
    var isSprit : Bool
    var size : CGSize
}
