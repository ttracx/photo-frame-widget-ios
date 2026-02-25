import SwiftUI
import PhotosUI
import StoreKit

class PhotoViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { loadPhoto() }
    }
    @Published var selectedImage: UIImage?
    @Published var isPro = false
    @Published var products: [Product] = []
    
    private let userDefaults = UserDefaults(suiteName: "group.com.yourname.photoframewidget")
    private let photoKey = "selectedPhoto"
    private let proKey = "isProUser"
    
    init() {
        isPro = userDefaults?.bool(forKey: proKey) ?? false
        Task {
            await loadProducts()
        }
    }
    
    func loadSavedPhoto() {
        if let data = userDefaults?.data(forKey: photoKey),
           let image = UIImage(data: data) {
            selectedImage = image
        }
    }
    
    private func loadPhoto() {
        guard let item = selectedItem else { return }
        
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                await MainActor.run {
                    selectedImage = uiImage
                    savePhoto(data)
                    WidgetCenter.shared.reloadAllTimelines()
                }
            }
        }
    }
    
    private func savePhoto(_ data: Data) {
        userDefaults?.set(data, forKey: photoKey)
    }
    
    // MARK: - IAP
    
    @MainActor
    func loadProducts() async {
        do {
            products = try await Product.products(for: ["com.yourname.photoframe.pro"])
        } catch {
            print("Failed to load products: \(error)")
        }
    }
    
    @MainActor
    func purchasePro() async {
        guard let product = products.first else { return }
        
        do {
            let result = try await product.purchase()
            switch result {
            case .success(let verification):
                switch verification {
                case .verified(let transaction):
                    isPro = true
                    userDefaults?.set(true, forKey: proKey)
                    await transaction.finish()
                case .unverified:
                    break
                }
            default:
                break
            }
        } catch {
            print("Purchase failed: \(error)")
        }
    }
    
    func restorePurchases() async {
        for await result in Transaction.currentEntitlements {
            switch result {
            case .verified(let transaction):
                if transaction.productID == "com.yourname.photoframe.pro" {
                    isPro = true
                    userDefaults?.set(true, forKey: proKey)
                }
            default:
                break
            }
        }
    }
}
