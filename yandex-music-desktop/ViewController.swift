//
//  ViewController.swift
//  yandex-music-desktop
//
//  Created by user on 11.03.2023.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKUIDelegate {
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration();
        webConfiguration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs");
        webView = WKWebView(frame: CGRect(x:0, y:0, width:800, height:600), configuration:webConfiguration);
        webView.uiDelegate = self;
        view = webView;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let requestUrl = URL(string: "https://passport.yandex.com/auth?origin=music_button-header&retpath=https%3A%2F%2Fmusic.yandex.com%2Fhome")
        self.webView.load(URLRequest(url: requestUrl!));
        self.view = webView;
    }
}
