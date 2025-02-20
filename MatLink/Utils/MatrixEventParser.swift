import MatrixSDK

class MatrixEventParser {
    static func parseMessageEvent(_ event: MXEvent) -> MatrixMessage? {
        guard let content = event.content,
              let body = content["body"] as? String else {
            return nil
        }
        
        return MatrixMessage(
            id: event.eventId,
            eventId: event.eventId,
            content: body,
            sender: event.sender,
            timestamp: event.date,
            isOutgoing: event.sender == MXSession.myUserId,
            reactions: [:]
        )
    }
}
