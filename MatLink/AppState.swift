import Combine

class AppState: ObservableObject { // 明确遵循ObservableObject
    @Published var isLoggedIn = false
    @Published var currentUser: MatrixUser?
}
