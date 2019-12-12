//
//  ViewController.swift
//  AQWritePOC
//
//  Created by Aaron on 11/5/19.
//  Copyright © 2019 Alchemy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var statusText: UITextView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    var logger: Logger?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add a border to the status textView
        statusText!.layer.borderWidth = 1
        statusText!.layer.borderColor = UIColor.darkGray.cgColor
        
        MultiLogger.shared.addLoggers(loggers: [self, ConsoleLogger()], clearAll: true)
        logger = MultiLogger.shared

        logger?.write("Ready")
    }

    func addToStatus(_ text: String) {
        DispatchQueue.main.async {
            var displayText = "[\(Date().stringWithFormat(format: "HH:mm:ss"))] \(text)"

            //Add newline characters to separate lines by an extra space
            if self.statusText.text.count > 0 {
                displayText = "\n\(displayText)"
            }
            self.statusText.text = "\(self.statusText.text ?? "")\(displayText)"

            //Scroll to bottom of the text
            if self.statusText.text.count > 0 {
                let location = self.statusText.text.count - 1
                let bottom = NSMakeRange(location, 1)
                self.statusText.scrollRangeToVisible(bottom)
            }
        }
    }

    @IBAction func clearLog(_ sender: Any) {
        self.statusText.text = ""
    }

    @IBAction func button1Action(_ sender: Any) {
        logger?.write("Button 1 pressed")
    }

    @IBAction func button2Action(_ sender: Any) {
        logger?.write("Button 2 pressed")
    }

    @IBAction func button3Action(_ sender: Any) {
        logger?.write("Button 3 pressed")
    }

    @IBAction func button4Action(_ sender: Any) {
        logger?.write("Button 4 pressed")
    }
}

extension ViewController: Logger {
    func write(_ text: String?) {
        addToStatus(text ?? "")
    }
}
