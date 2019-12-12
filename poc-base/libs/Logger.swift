//
//  Logger.swift
//  AQWritePOC
//
//  Created by Aaron on 11/11/19.
//  Copyright © 2019 Alchemy. All rights reserved.
//

import Foundation

protocol Logger {
    func write(_ text: String?)
}

class MultiLogger: Logger {

    static let shared = MultiLogger()

    var loggerList: [Logger] = []

    private init() { }

    func addLogger(logger: Logger, clearAll: Bool = false) {
        addLoggers(loggers: [logger], clearAll: clearAll)
    }

    func addLoggers(loggers: [Logger], clearAll: Bool = false) {
        print("Adding Loggers.  clearAll: \(clearAll)")
        if clearAll {
            self.loggerList = loggers
        } else {
            loggerList.append(contentsOf: loggers)
        }
    }

    func write(_ text: String?) {
        for logger in loggerList {
            logger.write(text ?? "")
        }
    }
}

class ConsoleLogger: Logger {

    func write(_ text: String?) {
        print(text ?? "")
    }

}
