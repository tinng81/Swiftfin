//
// Swiftfin is subject to the terms of the Mozilla Public
// License, v2.0. If a copy of the MPL was not distributed with this
// file, you can obtain one at https://mozilla.org/MPL/2.0/.
//
// Copyright (c) 2025 Jellyfin & Jellyfin Contributors
//

import SwiftUI

struct SinceLastDisappearModifier: ViewModifier {

    @State
    private var lastDisappear: Date? = nil

    let action: (TimeInterval) -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                guard let lastDisappear else { return }
                let interval = Date.now.timeIntervalSince(lastDisappear)
                action(interval)
            }
            .onDisappear {
                lastDisappear = Date.now
            }
    }
}
