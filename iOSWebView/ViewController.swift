//
//  ViewController.swift
//  iOSWebView
//
//  Created by Nikita Sandhu on 2020-03-24.
//  Copyright © 2020 Nikita Sandhu. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebKitView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLambtonUrl()
    }
    
    @IBAction func btnHistryClick(_ sender: UIBarButtonItem) {
        if myWebKitView.canGoBack{
            let historyList = myWebKitView.backForwardList.backList
            if historyList.count > 0{
                for item in historyList {
                    print("\(String(describing: item.title!)) - \(item.url.absoluteURL)")
                }
            }
        }
    }
    
    func loadLambtonUrl(){
        let url = URL(string: "https://www.lambtoncollege.ca")
        let urlReq = URLRequest(url: url!)
        myWebKitView.load(urlReq)
    }

    func loadHtmlString(){
        let htmlString = "<h1>Hello World</h1>"
        myWebKitView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnNavigation(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0: // Home Button is press
            loadLambtonUrl()
//            myWebKitView.load(URLRequest(url: URL(string: "https://www.lambtoncollege.ca")!))
        case 1: // Prev Button is pressed
            if myWebKitView.canGoBack{
                myWebKitView.goBack()
            }
        case 2:
            if myWebKitView.canGoForward{
                myWebKitView.goForward()
            }
        case 3:
            myWebKitView.reloadFromOrigin()
        
        default:
            print("No Navigation action found")
        }
    }
}

