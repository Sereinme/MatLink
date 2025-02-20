import Combine
import MatrixSDK

class ChatViewModel: ObservableObject {
    @Published var rooms: [MatrixRoom] = []
    @Published var directMessages: [MatrixRoom] = []
    @Published var selectedRoom: MatrixRoom?
    @Published var searchText: String = ""
    
    private let matrixService = MatrixService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupObservers()
    }
    
    private func setupObservers() {
        $searchText
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .sink { [weak self] text in
                self?.filterRooms(with: text)
            }
            .store(in: &cancellables)
    }
    
    @MainActor
    func loadRooms() async {
        do {
            let allRooms = try await matrixService.fetchRooms()
            rooms = allRooms.filter { !$0.isDirectMessage }
            directMessages = allRooms.filter { $0.isDirectMessage }
        } catch {
            print("Error loading rooms: \(error)")
        }
    }
}
