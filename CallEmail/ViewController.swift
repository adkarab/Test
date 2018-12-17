//
//  ViewController.swift
//  CallEmail
//
//  Created by mac on 17/12/2018.
//  Copyright © 2018 Nameless. All rights reserved.
//

import UIKit
import MessageUI
class ViewController: UIViewController , MFMailComposeViewControllerDelegate {

    let button1 = UIButton(frame: .zero)
    let button2 = UIButton(frame: .zero)
    let button3 = UIButton(frame: .zero)

    @objc func call (_ sender: UIButton){
        print("call")
        guard let number = URL(string: "tel://12345678") else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    @objc func email (_ sender: UIButton){
        print("email")
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
//            mail.setMessageBody("<p>You're so awesome!</p>", isHTML: true)
            
            present(mail, animated: true)
            //            self.navigationController?.present(mail, animated: true, completion: nil)
        } else {
            print("mfmailcompose fail")
            UIApplication.shared.open(URL(string: "mailto:example@gmail.com")! as URL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func email2 (_ sender: UIButton){
        print("email2")
        UIApplication.shared.open(URL(string: "mailto:example@gmail.com")! as URL, options: [:], completionHandler: nil)
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.setTitle("call", for: .normal)
        button2.setTitle("email", for: .normal)
        button3.setTitle("email2", for: .normal)

        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)

        button1.frame = CGRect(x: view.bounds.width/2 - 50, y: 100, width: 100, height: 30)
        button2.frame = CGRect(x: view.bounds.width/2 - 50, y: 200, width: 100, height: 30)
        button3.frame = CGRect(x: view.bounds.width/2 - 50, y: 300, width: 100, height: 30)

        button1.addTarget(self, action: #selector(call), for: .touchUpInside)
        button2.addTarget(self, action: #selector(email), for: .touchUpInside)
        button3.addTarget(self, action: #selector(email2), for: .touchUpInside)

        view.backgroundColor = .darkGray
    }


}

