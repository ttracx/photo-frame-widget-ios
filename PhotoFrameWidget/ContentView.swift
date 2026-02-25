import SwiftUI
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = PhotoViewModel()
    @State private var showingPaywall = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Header
                VStack(spacing: 8) {
                    Image(systemName: "photo.frame")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    
                    Text("Photo Frame")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text("Display your favorite photos on your Home Screen")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                // Photo Preview
                PhotoPreviewCard(viewModel: viewModel)
                
                // Action Buttons
                VStack(spacing: 12) {
                    PhotosPicker(selection: $viewModel.selectedItem,
                                matching: .images) {
                        HStack {
                            Image(systemName: "photo.badge.plus")
                            Text("Choose Photo")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(12)
                    }
                    
                    Button(action: { showingPaywall = true }) {
                        HStack {
                            Image(systemName: "crown.fill")
                            Text(viewModel.isPro ? "Pro Unlocked" : "Upgrade to Pro")
                        }
                        .font(.headline)
                        .foregroundColor(viewModel.isPro ? .green : .orange)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isPro ? Color.green.opacity(0.1) : Color.orange.opacity(0.1))
                        .cornerRadius(12)
                    }
                    .disabled(viewModel.isPro)
                }
                .padding(.horizontal)
                
                // Instructions
                VStack(alignment: .leading, spacing: 12) {
                    Text("How to add widget:")
                        .font(.headline)
                    
                    InstructionRow(number: 1, text: "Long press your Home Screen")
                    InstructionRow(number: 2, text: "Tap the + button in top left")
                    InstructionRow(number: 3, text: "Search 'Photo Frame' and select")
                    InstructionRow(number: 4, text: "Choose your widget size")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showingPaywall) {
            PaywallView(viewModel: viewModel)
        }
        .onAppear {
            viewModel.loadSavedPhoto()
        }
    }
}

struct PhotoPreviewCard: View {
    @ObservedObject var viewModel: PhotoViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemGray6))
                .frame(height: 200)
            
            if let image = viewModel.selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(8)
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "photo")
                        .font(.system(size: 40))
                        .foregroundColor(.secondary)
                    Text("No photo selected")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct InstructionRow: View {
    let number: Int
    let text: String
    
    var body: some View {
        HStack(spacing: 12) {
            Text("\(number)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Color.blue)
                .clipShape(Circle())
            
            Text(text)
                .font(.subheadline)
            
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
