import SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel: PhotoViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Spacer()
                
                // Icon
                Image(systemName: "crown.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.yellow)
                
                // Title
                Text("Go Pro")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Unlock premium features")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                // Features
                VStack(alignment: .leading, spacing: 16) {
                    FeatureRow(icon: "photo.stack", text: "Multiple photo widgets")
                    FeatureRow(icon: "clock.arrow.circlepath", text: "Auto-rotate photos hourly")
                    FeatureRow(icon: "wand.and.stars", text: "Advanced photo filters")
                    FeatureRow(icon: "rectangle.grid.2x2", text: "More widget sizes")
                }
                .padding(.horizontal, 40)
                
                Spacer()
                
                // Price
                VStack(spacing: 8) {
                    Text("$0.99")
                        .font(.system(size: 48, weight: .bold))
                    
                    Text("One-time purchase")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                
                // Buttons
                VStack(spacing: 12) {
                    Button(action: {
                        Task {
                            await viewModel.purchasePro()
                            if viewModel.isPro {
                                dismiss()
                            }
                        }
                    }) {
                        Text("Purchase")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    
                    Button(action: {
                        Task {
                            await viewModel.restorePurchases()
                            if viewModel.isPro {
                                dismiss()
                            }
                        }
                    }) {
                        Text("Restore Purchases")
                            .font(.subheadline)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarItems(trailing: Button("Close") { dismiss() })
        }
    }
}

struct FeatureRow: View {
    let icon: String
    let text: String
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.blue)
                .frame(width: 32)
            
            Text(text)
                .font(.body)
            
            Spacer()
        }
    }
}

#Preview {
    PaywallView(viewModel: PhotoViewModel())
}
