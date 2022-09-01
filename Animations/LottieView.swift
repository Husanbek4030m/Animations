import Lottie
import SwiftUI

struct LottieView: UIViewRepresentable {

    let fileName: String
    let isEnabled: Bool

    private let animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)

        animationView.animation = Animation.named(fileName)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieView>) {
        if isEnabled {
            context.coordinator.parent.animationView.play()
        } else {
            context.coordinator.parent.animationView.stop()
        }
    }

    class Coordinator: NSObject {
        var parent: LottieView

        init(_ parent: LottieView) {
            self.parent = parent
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
