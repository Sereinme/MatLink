import Foundation

struct MatrixRoom: Identifiable, Codable {
    let id: String
    let name: String
    let isDirectMessage: Bool
    var messages: [MatrixMessage]
    var lastActivity: Date
    var unreadCount: Int
    var avatarURL: URL?
}

struct MatrixMessage: Identifiable, Codable {
    let id: String
    let eventId: String
    let content: String
    let sender: String
    let timestamp: Date
    let isOutgoing: Bool
    var reactions: [String: Int]
    var editHistory: [String]?
}

struct MatrixUser: Codable {
    let userId: String
    let displayName: String
    let avatarURL: URL?
    var presence: PresenceStatus
    
    enum PresenceStatus: String, Codable {
        case online, offline, busy
    }
} 