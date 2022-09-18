/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct UserDetail: View {
    var user: User

    var body: some View {
        ScrollView {
            MapView(coordinate: user.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: user.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.title)

                HStack {
                    Text(user.park)
                    Spacer()
                    Text(user.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(user.name)")
                    .font(.title2)
                Text(user.description)
            }
            .padding()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(user: users[0])
    }
}
