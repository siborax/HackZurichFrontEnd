/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct UserRow: View {
    var user: User

    var body: some View {
        HStack {
            user.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(user.name)

            Spacer()
        }
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserRow(user: users[0])
            UserRow(user: users[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
