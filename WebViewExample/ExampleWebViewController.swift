//
//  ExampleWebViewController.swift
//  SeSAC2LectureNetworkBasic
//
//  Created by Y on 2022/07/28.
//

import UIKit
import WebKit

class ExampleWebViewController: UIViewController {
    
    var destinationURL: String = "https://www.apple.com"
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var crossButton: UIBarButtonItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var forwardButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        designButton()
    }
    
    func openWebPage(url: String){
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        webView.load(request)
    }

    func designButton() {
        crossButton.image = UIImage(systemName: "xmark")
        backButton.image = UIImage(systemName: "arrowshape.turn.up.backward.fill")
        refreshButton.image = UIImage(systemName: "arrow.counterclockwise")
        forwardButton.image = UIImage(systemName: "arrowshape.turn.up.right.fill")
    }
   
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        webView.goBack()

    }
    @IBAction func refreshButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func forwardButtonTapped(_ sender: UIBarButtonItem) {
        webView.goForward()
    }
    
}



extension ExampleWebViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchURL = searchBar.text!
        if !searchURL.contains("http://"){
            let httpURL = "http://" + "\(searchURL)"
            openWebPage(url: httpURL)
        } else {
            openWebPage(url: searchURL)
        }
    }
}


