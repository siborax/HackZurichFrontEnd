/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI

struct UserList: View {
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink {
                    UserDetail(user: user)
                } label: {
                    UserRow(user: user)
                }
            }
            .navigationTitle("Current User")
        }
    }
}

struct UserList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            UserList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
