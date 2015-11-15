//
//  ViewController.swift
//  SFVC Spotify Login
//
//  Created by Jorden Kreps on 11/15/15.
//  Copyright © 2015 Jorden Kreps. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    let ClientID = ""
    let RedirectURL = NSURL(string: "")
    let NotificationName = "SafariViewControllerDidCompleteLogin"
    
    var spotifyLoginButton : UIButton?
    var descriptionLabel: UILabel?
    var safariVC: SFSafariViewController?
    var spotifySession: SPTSession?

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loginWasHandled:", name: self.NotificationName, object: nil)
        
        let centerX = (self.view.frame.size.width / 2)
        let centerY = (self.view.frame.size.height / 2)
        
        self.spotifyLoginButton = UIButton.init(frame: CGRectMake(centerX - 125, centerY - 22.5, 250, 45))
        self.spotifyLoginButton!.setImage(UIImage(named: "SpotifyLogin"), forState: .Normal)
        self.spotifyLoginButton!.addTarget(self, action: Selector("loginButtonPressed"), forControlEvents: .TouchUpInside)
        
        self.descriptionLabel = UILabel.init(frame: CGRectMake(centerX - 117.5, (centerY - 7.5) + 50, 235, 15))
        self.descriptionLabel!.text = "Click to login with SFSafariViewController"
        self.descriptionLabel!.font = UIFont.systemFontOfSize(12)
        
        self.view.addSubview(self.spotifyLoginButton!)
        self.view.addSubview(self.descriptionLabel!)
        
    }
    
    func loginButtonPressed() {
        
        SPTAuth.defaultInstance().clientID = self.ClientID
        SPTAuth.defaultInstance().redirectURL = self.RedirectURL
        
        let url = SPTAuth.defaultInstance().loginURL
        
        self.safariVC = SFSafariViewController(URL: url)
        
        self.presentViewController(safariVC!, animated: true, completion: nil)
        
    }
    
    func loginWasHandled(notification: NSNotification) {
        
        if let session = notification.object as? SPTSession {
            
            self.spotifySession = session
            
        }
        
        self.spotifyLoginButton?.enabled = false
        self.descriptionLabel?.text = "Successfully Authenticated!"
        self.descriptionLabel?.textAlignment = NSTextAlignment.Center
        
        self.safariVC!.dismissViewControllerAnimated(true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

