//
//  FeedViewController.swift
//  JAr
//
//  Created by Abdiaziz Weheliye on 5/2/20.
//  Copyright © 2020 JAr coorprate. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    
    var messages = [PFObject]()
    let chatMessage = PFObject(className: "Message")
    @IBOutlet weak var feedTableView: UITableView!
    @IBOutlet weak var chatMessageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(FeedViewController.onTimer), userInfo: nil, repeats: true)

    }
    
    @IBAction func onSend(_ sender: Any) {
        //saves user and message info
        let chatMessage = PFObject(className: "Message")
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
    
    @objc func onTimer() {
    // Add code to be run periodically
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

   
