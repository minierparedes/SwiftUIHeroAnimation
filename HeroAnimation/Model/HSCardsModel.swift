//
//  HSCardsModel.swift
//  HeroAnimation
//
//  Created by ethancr0wn on 2021/04/07.
//

import Foundation


struct HSCardModel: Identifiable {
    var id: Int
    var title: String
    var img: String
}


var hsCardData = [
    HSCardModel(id: 0, title: "Ilidari Studies", img: "hsCard1"),
    HSCardModel(id: 1, title: "NetherWalker", img: "hsCard2"),
    HSCardModel(id: 2, title: "Demon Companion", img: "hsCard3"),
    HSCardModel(id: 3, title: "Sigil of Silence", img: "hsCard4"),
    HSCardModel(id: 4, title: "Redeemed Pariah", img: "hsCard5"),
    HSCardModel(id: 5, title: "Kor'vahs BloodThorn", img: "hsCard6")
]
