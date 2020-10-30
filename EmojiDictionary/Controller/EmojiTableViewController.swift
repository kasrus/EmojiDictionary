//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Kasumi Ruslim on 10/28/20.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    var emojis:[EmojiCollections] = [
        EmojiCollections(category: "Smileys & People", emoji: [
            Emoji(symbol: "😀", name: "Grinning Face",
            description: "A typical smiley face.", usage: "happiness"),
            Emoji(symbol: "😕", name: "Confused Face",
            description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
            Emoji(symbol: "😍", name: "Heart Eyes",
            description: "A smiley face with hearts for eyes.",
            usage: "love of something; attractive"),
            Emoji(symbol: "👮", name: "Police Officer",
            description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")
        ]),
        EmojiCollections(category: "Animals & Nature", emoji: [
            Emoji(symbol: "🐢", name: "Turtle", description:
            "A cute turtle.", usage: "Something slow"),
            Emoji(symbol: "🐘", name: "Elephant", description:
            "A gray elephant.", usage: "good memory")
        ]),
        EmojiCollections(category: "Food & Drinks", emoji: [
            Emoji(symbol: "🍝", name: "Spaghetti",
            description: "A plate of spaghetti.", usage: "spaghetti")
        ]),
        EmojiCollections(category: "Activity", emoji: [
            Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
        ]),
        EmojiCollections(category: "Travel & Places", emoji: []),
        EmojiCollections(category: "Objects", emoji: [
            Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
            Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")
        ]),
        EmojiCollections(category: "Symbols", emoji: [
            Emoji(symbol: "💔", name: "Broken Heart",
                    description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore",
                    description:
                    "Three blue \'z\'s.", usage: "tired, sleepiness")
        ]),
        EmojiCollections(category: "Flags", emoji: [
            Emoji(symbol: "🏁", name: "Checkered Flag",
            description: "A black-and-white checkered flag.", usage:
            "completion")
        ])
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        emojis.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis[section].emoji.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //FIXME: - Object category has no emoji's inside - don't show on table if no emoji
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let emoji = emojis[indexPath.section].emoji[indexPath.row]
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
        cell.detailTextLabel?.text = emoji.description
        //FIXME: - Reordering not working in section
        cell.showsReorderControl = true
        
        return cell
    }
    
    //MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.section].emoji[indexPath.row]
        print ("\(emoji.symbol) \(indexPath)")
    }

    
    @IBAction func editButtonTapped(_ sender: Any) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
  
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView,
    editingStyleForRowAt indexPath: IndexPath) ->
    UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return emojis[section].category
    }
    
    // TODO: - Delete category to work
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

 

}
