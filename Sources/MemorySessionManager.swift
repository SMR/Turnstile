//
//  MemorySessionManager.swift
//  VaporTurnstile
//
//  Created by Edward Jiang on 7/26/16.
//
//

import Foundation

public class MemorySessionManager: SessionManager {
    var sessions = [String: Subject]()
    weak var turnstile: Turnstile!
    
    public func boot(turnstile: Turnstile) {
        self.turnstile = turnstile
    }
    
    
    public func getSubject(identifier: String) -> Subject? {
        return sessions[identifier]
    }
    
    public func createSession(subject: Subject) -> String {
        // Temp implementation; actually fix later
        let identifier = String(arc4random_uniform(1000000))
        subject.sessionIdentifier = identifier
        sessions[identifier] = subject
        return identifier
    }
    
    public func deleteSession(identifier: String) {
        sessions.removeValue(forKey: identifier)
    }
}
