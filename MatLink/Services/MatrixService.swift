import Combine
import MatrixSDK

class MatrixService: ObservableObject {
    static let shared = MatrixService()
    private var client: MXRestClient?
    private var session: MXSession?
    
    @MainActor
    func login(homeserver: URL, userId: String, password: String) async throws {
        let client = MXRestClient(homeServer: homeserver, identifier: userId)
        let credentials = try await client.login(username: userId, password: password)
        self.client = client
        self.session = MXSession(matrixRestClient: client)
        await session?.start()
    }
    
    @MainActor
    func fetchRooms() async throws -> [MatrixRoom] {
        guard let session = session else { throw MatrixError.notLoggedIn }
        return await withCheckedContinuation { continuation in
            session.rooms.forEach { room in
                // 转换MXRoom到MatrixRoom
            }
            continuation.resume(returning: [])
        }
    }
    
    enum MatrixError: Error {
        case notLoggedIn
        case networkError
    }
}
