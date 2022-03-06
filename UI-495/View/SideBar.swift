//
//  SideBar.swift
//  UI-495
//
//  Created by nyannyan0328 on 2022/03/06.
//

import SwiftUI

struct SideBar: View {
    
    var prop : Properties
    
    @Binding var currentMenu : String
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 13) {
                
              Image("Logo")
                   
                
                sideBarButton(icon: "tray.and.arrow.up.fill", title: "In Box")
                    .padding(.top,40)
                
                sideBarButton(icon: "paperplane", title: "Sent")
                sideBarButton(icon: "doc.fill", title: "Draft")
                sideBarButton(icon: "trash", title: "Deleted")
                
                
                
                
                
            }
            .padding()
            .padding(.top)
            
        }
        .frame(width: (prop.isRandScape ? prop.size.width : prop.size.height) / 4 > 300 ? 900 : (prop.isRandScape ? prop.size.width : prop.size.height) / 4)
        .background(
        
    Color("LightWhite")
        .ignoresSafeArea()
        
        )
    }
    
    @ViewBuilder
    func sideBarButton(icon : String,title : String)->some View{
        
        
        Button {
            withAnimation{
                
                currentMenu = title
            }
        } label: {
            
            
            VStack{
                
                
                HStack(spacing:10){
                    
                    
                    
                    Image(systemName: "chevron.right")
                        .font(.title2)
                        .opacity(currentMenu == title ? 1 : 0)
                    
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(currentMenu == title ? Color("DarkBlue") : .gray)
                    
                    
                    Text(title)
                        .foregroundColor(currentMenu == title ? .black : .gray)
                    
                    
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                
                Divider()
            }
            
           
        }

        
    }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PaddingModifier : ViewModifier{
    
    var prop : Properties
    @Binding var padding : CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .overlay{
                
                
                GeometryReader{proxy in
                    
                    Color.clear
                        .preference(key: PaddingKey.self, value: proxy.frame(in: .global))
                        .onPreferenceChange(PaddingKey.self) { value in
                            
                            
                            padding = -(value.minX / 3.3)
                        }
                    
                    
                    
                }
            }
    }
}

struct PaddingKey : PreferenceKey{
    
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        
        value = nextValue()
    }
    
    
}
