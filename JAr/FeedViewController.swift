//
//  FeedViewController.swift
//  JAr
//
//  Created by Abdiaziz Weheliye on 5/2/20.
//  Copyright © 2020 JAr coorprate. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    var chatMessages = [PFObject]()
    let chatMessage = PFObject(className: "Message")
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var chatMessageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.dataSource = self
        feedTableView.delegate = self
            // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
        onTimer()
        self.feedTableView.reloadData()
    }
    
    @IBAction func onSend(_ sender: Any) {
        //saves user and message info
        let chatMessage = PFObject(className: "Message")
        chatMessage["text"] = chatMessageField.text!
        chatMessage["user"] = PFUser.current();
        chatMessage.saveInBackground { (success, error) in
            if success {
                print("The message was saved!")
                self.chatMessageField.text = ""
                self.onTimer()
            }
            else if let error = error {
                  print("Problem saving message: \(error.localizedDescription)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell") as! ChatCell
        let chatList = chatMessages[indexPath.row]
        cell.messageList.text = chatList["text"] as? String
        if let user = chatList["user"] as? PFUser{
            cell.userList.text = user.username
        }
        else{
            cell.userList.text = "Random Family Member"
        }
        return cell
    }
    
    
    @objc func onTimer(){
        let query = PFQuery(className: "Message")
        query.addDescendingOrder("createdAt")
        query.limit = 8
        query.includeKey("user")
        query.findObjectsInBackground { (messages, error) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let messages = messages {
                // The find succeeded.
                self.chatMessages = messages
                print("Successfully retrieved \(messages.count) posts.")
            }
        }
        print ("Reload Feed TableView")
        self.feedTableView.reloadData();
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

   
