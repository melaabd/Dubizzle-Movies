//
//  AboutViewController.swift
//  Dubizzle-Movies-List_iOSApp
//
//  Created by El-Abd on 12/23/19.
//  Copyright © 2019 El-Abd. All rights reserved.
//

import UIKit
import MessageUI

final class AboutViewController: UIViewController {

    // MARK: - IBOutlet Properties
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var mailButton: UIButton!
    @IBOutlet weak var githubButton: UIButton!
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    
    // MARK: - Properties
    
    private let router: Router
    private var buttons: [UIButton] { return [shareButton, mailButton, githubButton, linkedInButton] }
    
    // MARK: - Initializer
    
    init(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
        tabBarItem = router.tabBarItem(for: .about)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    // MARK: - UIViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Analytics.track(viewContent: "About", ofType: "View")
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        title = "About"
        buttons.forEach { $0.tintColor = UIColor(commonColor: .yellow) }
        creditLabel.text = "App icon by Shmidt Sergey from the Noun Project."
        creditLabel.apply(style: TextStyle.bodyTiny)
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        versionLabel.apply(style: TextStyle.bodyDemiBold)
        versionLabel.text = "Dubizzle-Movies v\(versionNumber) build \(buildNumber)"
    }
    
    // MARK: - IBAction functions
    
    @IBAction func shareButtonTapped(sender: UIButton) {
        let shareText: String = "Check out Du-Movies!"
        let url: URL = URL(string: "https://itunes.apple.com")!
        let items: [Any] = [shareText, url]
        let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func mailButtonTapped(sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            
            let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
            let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
            let mailComposerViewController = MFMailComposeViewController()
            mailComposerViewController.mailComposeDelegate = self
            mailComposerViewController.setToRecipients(["mohamd.elaabd@gmail.com"])
            mailComposerViewController.setSubject("Hello!")
            mailComposerViewController.setMessageBody("\n\n\n\nSent from Dubizzle-Movies iOS - v\(versionNumber) build \(buildNumber)", isHTML: false)
            self.present(mailComposerViewController, animated: true, completion: nil)
            
        } else {
            let alert = UIAlertController(title: "Can't send Email", message: "Your device can't send e-mail. Please check your email configuration and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Go to settings", style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
                let settingsUrl = URL(string: UIApplication.openSettingsURLString)
                UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func githubButtonTapped(sender: UIButton) {
        let url = URL(string: "https://github.com/mohamdelaabd")!
        self.open(url: url, withAlertMessage: "You will redirected to Github.")
    }
    
    @IBAction func linkedInButtonTapped(sender: UIButton) {
        let url = URL(string: "https://www.linkedin.com/in/mohamdelaabd/")!
        self.open(url: url, withAlertMessage: "You will redirected to LinkedIn.")
    }
    
    // MARK: -
    
    fileprivate func open(url: URL, withAlertMessage message: String) {
        
        UserDefaults.performOnce(forKey: "com.elaabd.Dubizzle-Movies-List-iOSApp", perform: {
            let alert = UIAlertController(title: "Leave the app?", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default) { _ in
                alert.dismiss(animated: true, completion: nil)
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            })
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            self.present(alert, animated: true, completion: nil)
        }, elsePerform: {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        })
    }
}

// MARK: -

extension AboutViewController: MFMailComposeViewControllerDelegate {
    
    // MARK: -
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
