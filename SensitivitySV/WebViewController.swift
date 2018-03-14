//
//  WebViewController.swift
//  NiconLensWear
//
//  Created by 森邦彦 on 2017/11/23.
//  Copyright © 2017年 Nicon-Essilor. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadAddressURL()
        self.setNeedsStatusBarAppearanceUpdate()
    }

    func loadAddressURL() {
        
        let dataServer = DataServer.shared
        let region = dataServer.getRegion()
        var requestURL:NSURL = NSURL(string:"")!

        if (region == Region.US) {
            requestURL = NSURL(string: "http://www.nikon-essilor.co.jp/support/manual/manual_en.pdf")!
        } else if (region == Region.CH1) {
            requestURL = NSURL(string: "http://www.nikon-essilor.co.jp/support/manual/manual_ch_s.pdf")!
        } else if (region == Region.CH2) {
            requestURL = NSURL(string: "http://www.nikon-essilor.co.jp/support/manual/manual_ch_t.pdf")!
        } else if (region == Region.JP) {
            requestURL = NSURL(string: "http://www.nikon-essilor.co.jp/support/manual/manual_jp.pdf")!
        }
                
        let req = URLRequest(url: requestURL as URL)
        
        webView.loadRequest(req)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
