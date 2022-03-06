//
//  User.swift
//  UI-495
//
//  Created by nyannyan0328 on 2022/03/06.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID().uuidString
    var name : String
    var image : String
    var title : String
}

var users : [User] = [

User(name: "Nyan nyan", image: "User1", title: "MLB Event is herer"),
User(name: "ニャン", image: "User2", title: "Yuna is Coming"),
User(name: "ニャンめん", image: "User3", title: "New XM-5 Desgin"),
User(name: "にゃにゃにゃ", image: "User4", title: "Iphone with multiple Colors")

]

