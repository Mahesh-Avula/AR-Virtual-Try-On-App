//
//  ContentView.swift
//  AR Virtual Try-On App
//
//  Created by Mahesh Avula on 28/01/25.
//

import SwiftUI
import ARKit
import UIKit

struct ContentView: View {
    @State private var isARViewPresented = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "face.dashed")
                    .imageScale(.large)
                    .font(.system(size: 60))
                    .foregroundStyle(.blue)
                
                Text("AR Virtual Try-On")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView {
                    VStack(spacing: 15) {
                        FeatureCard(title: "Try Glasses",description: "Virtual try-on for glasses with real-time face tracking",iconName: "eyeglasses",action: { isARViewPresented = true })
                        FeatureCard(title: "Try Watches",description: "Virtual try-on for watches with wrist detection",iconName: "applewatch",action: { })
                        FeatureCard(title: "Settings",description: "Configure AR settings and preferences",iconName: "gear",action: {})
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("AR Try-On")
                        .font(.headline)
                }
            }
        }
//        .fullScreenCover(isPresented: $isARViewPresented) {
//            ARViewContainer()
//                .edgesIgnoringSafeArea(.all)
//                .overlay(alignment: .topTrailing) {
//                    Button(action: { isARViewPresented = false }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.title)
//                            .foregroundColor(.white)
//                            .padding()
//                    }
//                }
//        }
    }
}

struct FeatureCard: View {
    let title: String
    let description: String
    let iconName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 15) {
                Image(systemName: iconName)
                    .font(.system(size: 30))
                    .foregroundColor(.blue)
                    .frame(width: 60,height: 60)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                        .font(.headline)
                    
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// SwiftUI wrapper for UIKit AR View
//struct ARViewContainer: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> ARTryOnViewController {
//        return ARTryOnViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: ARTryOnViewController, context: Context) {
//        // Update the view controller if needed
//    }
//}

// Preview Provider
#Preview {
    ContentView()
}
