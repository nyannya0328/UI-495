//
//  Home.swift
//  UI-495
//
//  Created by nyannyan0328 on 2022/03/06.
//

import SwiftUI

struct Home: View {
    @State var currentMenu : String = "In Box"
    
    @State var showMenu : Bool = false
    
    @State var excessPadding : CGFloat = 0
    
    
    @State var navigationTag : String?
    var body: some View {
        RecponceView { prop in
            
            HStack(spacing:0){
                
                if prop.isRandScape && !prop.isSprit{
                    
                    SideBar(prop: prop, currentMenu: $currentMenu)
                }
                NavigationView{
                    
                    
                  mainView(prop: prop)
                        .navigationBarHidden(true)
                        .padding(.leading,prop.isIpad && prop.isRandScape ? excessPadding : 0)
                    
                }
                .modifier(PaddingModifier(prop: prop, padding: $excessPadding))
                
                
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .overlay{
                
                
                ZStack(alignment: .leading) {
                    
                    Color.black.opacity(showMenu ? 0.25 : 0).ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation{
                                
                                showMenu.toggle()
                            }
                        }
                    
                    
                    if !prop.isRandScape || prop.isSprit{
                        SideBar(prop: prop, currentMenu: $currentMenu)
                            .offset(x:showMenu ? 0 : -300)
                         
                    }
                }
            }
            
            
            
        }
        .ignoresSafeArea(.container, edges: .leading)
    }
  
    @ViewBuilder
    func mainView(prop:Properties) -> some View{
        
        VStack(spacing:0){
            
            HStack(spacing:20){
                
                
                if !prop.isRandScape || prop.isSprit{
                    
                    Button {
                        
                        withAnimation{
                            
                            showMenu.toggle()
                        }
                        
                    } label: {
                        
                        Image(systemName: "line.3.horizontal")
                            .font(.title3)
                            .foregroundColor(.black)
                    }


                    
                    
                }
                
                
                TextField("Search", text: .constant(""))
                
                
                Image(systemName: "magnifyingglass")
            }
           // .foregroundColor(.black)
            .padding(.horizontal)
            .padding(.vertical)
           
            .background(
            
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .fill(.white)
            
            )
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:10){
                    
                    
                    ForEach(users){user in
                        
                        
                        NavigationLink(tag:user.id,selection: $navigationTag) {
                            
                            DetailView(prop: prop, user: user)
                            
                        } label: {
                            
                            
                            userCardView(prop: prop, user: user)
                            
                            
                            
                            
                            
                        }

                        
                    }
                }
                .padding(.top,30)
                
                
            }
            
        }
        .padding()
     
        .frame(maxHeight: .infinity,alignment: .top)
     
        .background(Color("BG").ignoresSafeArea())
        .onAppear {
            
            
            navigationTag = nil
        }
        
        
        
        
    }
    
    @ViewBuilder
    func userCardView(prop : Properties,user : User)->some View{
        
        VStack(alignment: .leading, spacing: 15) {
            
            
            HStack(spacing:20){
                
                
                Image(user.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    
                    Text(user.name)
                        .fontWeight(.bold)
                        
                    
                    Text(user.title)
                        .font(.caption)
                }
                .foregroundColor(navigationTag == user.id && prop.isIpad ? .red.opacity(0.3) : .black)
                .frame(maxWidth:.infinity,alignment: .leading)
                
                
                
                Text("Now")
                    .foregroundColor(navigationTag == user.id && prop.isIpad ? .red.opacity(0.3) : .black)
                    
            }
            .foregroundColor(.black)
            
            Text("Jaob Degrom,Gerrit Cole.Aroldis Chapman.Yu DarVish.Roki Sasaki")
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
                .foregroundColor(navigationTag == user.id && prop.isIpad ? .red.opacity(0.3) : .black)
            
            
        }
        .padding()
        .background(
        
        
        
        
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(navigationTag == user.id && prop.isIpad ? Color("DarkBlue") : Color("LightWhite"))
        
        
        )
    
        
        
        
        
        
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
