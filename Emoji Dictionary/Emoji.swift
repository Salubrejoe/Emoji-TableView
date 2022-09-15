

import Foundation

struct Emoji: Codable {
    
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    static var archiveURL: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("Emoji").appendingPathExtension("plist")
        
        return archiveURL
    }
    
    static var sampleEmojis: [Emoji] = [
        Emoji(symbol: "😙", name: "Kissing Face", description: "Little yellow face blowing a kiss", usage: "affection, love"),
        Emoji(symbol: "🤩", name: "Star Eyes Smile", description: "Smily happy place type of facer", usage: "happiness, excitement"),
        Emoji(symbol: "🥵", name: "Tired face", description: "Little red face with the tongue out from fatigue", usage: "tired, exhausted, hot"),
        Emoji(symbol: "👻", name: "Ghost", description: "Little classic sheet ghost", usage: "halloween, fear"),
        Emoji(symbol: "🤖", name: "Robot", description: "Robot face very cubic", usage: "machine, hardware"),
        Emoji(symbol: "🤌", name: "Italian WTF", description: "Little hand that suggest someone does not understand something", usage: "surprise, italian"),
        Emoji(symbol: "💂‍♀️", name: "King's guard", description: "Head of a typical English guard", usage: "guard, police, england"),
        Emoji(symbol: "💅", name: "Polishing nails", description: "A yellow hand with purple finger getting painted", usage: "nails, getting ready"),
        Emoji(symbol: "👘", name: "Kimono", description: "Orange dress of some Japanese tradition", usage: "kimono, clothes"),
        Emoji(symbol: "🦉", name: "Owl", description: "An owl posing", usage: "owl, bird, night"),
        Emoji(symbol: "🐝", name: "Bee", description: "A little pollinator", usage: "bee, pollen, wasp"),
        Emoji(symbol: "🌖", name: "Moon", description: "Descrescent moon, first quarter", usage: "moon, astronomy"),
        Emoji(symbol: "🍄", name: "Mushroom", description: "Classic depiction of a cartoonish mushroom", usage: "mushrooms, smurfs")
        
    ]
    
    static func saveToFile(emojis: [Emoji]) {
        let encoder = PropertyListEncoder()
        do {
            let encodedEmojis = try encoder.encode(emojis)
            try encodedEmojis.write(to: Emoji.archiveURL)
        } catch {
            print("Error encoding emojis: \(error)")
        }
    }
    
    
    static func loadFromFiles() -> [Emoji]? {
        guard let emojiData = try? Data(contentsOf: Emoji.archiveURL) else { return nil }
        
        do {
            let decoder = PropertyListDecoder()
            let decodedEmojis = try decoder.decode([Emoji].self, from: emojiData)
            
            return decodedEmojis
        } catch {
            print("Error decoding emojis: \(error)")
            return nil
        }
    }
    
    
}
