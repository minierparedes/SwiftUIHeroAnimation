//
//  HSCardsModel.swift
//  HeroAnimation
//
//  Created by ethancr0wn on 2021/04/07.
//

import Foundation


struct HSCardModel: Identifiable {
    var id: Int
    var name: String
    var img: String
    var text: String
    var flavor: String
    var type: String
    var rarity: String
    var classType: String
    var set: String
    var collectible: Bool
}


var hsCardData = [
    HSCardModel(id: 0, name: "Ilidari Studies", img: "hsCard1", text: "Discover an Outcast card. Your next one costs (1) less.", flavor: "Don't read texts and drive.", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: true),
    HSCardModel(id: 1, name: "NetherWalker", img: "hsCard2", text: "Battlecry: Discover a Demon.", flavor: "You got to Nethercrawl before you can Netherwalk.", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: false),
    HSCardModel(id: 2, name: "Demon Companion", img: "hsCard3", text: "Summon a random Demon Companion.", flavor: "Owning a pet can be real hell at times.", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: true),
    HSCardModel(id: 3, name: "Sigil of Silence", img: "hsCard4", text: "At the start of your next turn, Silence all enemy minions.", flavor: "A little heard-of spell.", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: true),
    HSCardModel(id: 4, name: "Redeemed Pariah", img: "hsCard5", text: "After you play an Outcast card, gain +1/+1.", flavor: "Look at this stick. Look at it!", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: false),
    HSCardModel(id: 5, name: "Kor'vas BloodThorn", img: "hsCard6", text: "Charge, Lifesteal After you play a card with Outcast, return this to your hand.", flavor: "Illidan taught her that demon hunters should sacrifice EVERYTHING… but she still brought Lifesteal just in case.", type: "Spell", rarity: "Common", classType: "Demon Hunter", set: "Madness at the Darkmoon Faire", collectible: true)
]
