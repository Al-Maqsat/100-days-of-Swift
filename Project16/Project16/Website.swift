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
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("we are here")
        let url = URL(string: "https://en.wikipedia.org/wiki/Astana")!
        
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}

