//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Steve Anavi on 8/31/15.
//  Copyright (c) 2015 Steve Anavi. All rights reserved.
//

import UIKit
class AboutViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }

override func viewDidLoad() { super.viewDidLoad()
    if let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html") {
    let htmlData = NSData(contentsOfFile: htmlFile)
    let baseURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
    webView.loadData(htmlData, MIMEType: "text/html",
    textEncodingName: "UTF-8", baseURL: baseURL)
    }
}
}