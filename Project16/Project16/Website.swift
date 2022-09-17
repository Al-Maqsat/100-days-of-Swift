//
//  Website.swift
//  Project16
//
//  Created by Maksat Baiserke on 17.09.2022.
//
import UIKit
import WebKit

class WebsiteViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    var name: String?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad() // Why we need this line ? for what?
        guard let name = name else {return}
        let url = URL(string: "https://en.wikipedia.org/wiki/\(name)")!
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

