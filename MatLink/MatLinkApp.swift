//
//  MatLinkApp.swift
//  MatLink
//
//  Created by 李文昊 on 2025/2/20.
//

import SwiftUI

@main
struct MatrixClientApp: App {
    // 确保所有ViewModel都继承ObservableObject
    @StateObject private var appState = AppState()
    @StateObject private var chatViewModel = ChatViewModel()

    var body: some Scene {
        WindowGroup {
            ContentSwitchView()
                .environmentObject(appState)
                .environmentObject(chatViewModel)
        }
        .commands {
            CommandMenu("聊天") {
                Button("新建聊天") { /* ... */ }
            }
        }
    }
}

// 状态控制中间视图
struct ContentSwitchView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            if appState.isLoggedIn {
                ChatView()
            } else {
                LoginView()
            }
        }
    }
}

// 应用全局状态
class AppState: ObservableObject {
    @Published var isLoggedIn = false
    @Published var currentUser: MatrixUser?
}
