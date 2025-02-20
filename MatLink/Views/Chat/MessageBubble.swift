import SwiftUI

struct MessageBubble: View {
    let message: MatrixMessage
    @Environment(\.colorScheme) var colorScheme
    
    var bubbleColor: Color {
        message.isOutgoing ? .blue : Color(.controlBackgroundColor)
    }
    
    var body: some View {
        HStack(alignment: .bottom) {
            if !message.isOutgoing {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 24))
            }
            
            VStack(alignment: .leading) {
                Text(message.content)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(bubbleColor)
                    .cornerRadius(12)
                
                HStack {
                    Text(message.timestamp, style: .time)
                        .font(.caption2)
                    
                    if !message.reactions.isEmpty {
                        ReactionsView(reactions: message.reactions)
                    }
                }
            }
        }
    }
}
