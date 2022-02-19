//
//  ViewController.swift
//  dummy
//
//  Created by Steve Küng on 18.02.22.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var titelLabel: NSTextField!
    @IBOutlet weak var CFBundleShortVersionStringLabel: NSTextField!
    @IBOutlet weak var CFBundleVersonLabel: NSTextField!
    @IBOutlet weak var installedText: NSTextField!
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titelLabel.stringValue = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
        CFBundleShortVersionStringLabel.stringValue = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
        CFBundleVersonLabel.stringValue = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
        
        let text = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? ""
        let fullText = text + " is installed successfully!"
        installedText.stringValue = fullText
        
        
        print(Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as Any)
        print(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as Any)
        print(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as Any)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

