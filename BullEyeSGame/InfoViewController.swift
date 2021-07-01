//
//  InfoViewController.swift
//  BullEyeSGame
//
//  Created by Mac on 29.06.2021.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(
            forResource: "Bullseye",
            withExtension: "html"
        ) else { return }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    @IBAction func closeButtonTapped() {
        dismiss(animated: true)
    }
    
}
