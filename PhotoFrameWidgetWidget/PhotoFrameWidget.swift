import WidgetKit
import SwiftUI

struct PhotoProvider: TimelineProvider {
    func placeholder(in context: Context) -> PhotoEntry {
        PhotoEntry(date: Date(), image: nil)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (PhotoEntry) -> ()) {
        let entry = PhotoEntry(date: Date(), image: loadSavedImage())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [PhotoEntry] = []
        let currentDate = Date()
        
        // Refresh every 15 minutes
        for offset in [0, 15, 30, 45] {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: currentDate)!
            let entry = PhotoEntry(date: entryDate, image: loadSavedImage())
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    private func loadSavedImage() -> UIImage? {
        let userDefaults = UserDefaults(suiteName: "group.com.yourname.photoframewidget")
        guard let data = userDefaults?.data(forKey: "selectedPhoto") else { return nil }
        return UIImage(data: data)
    }
}

struct PhotoEntry: TimelineEntry {
    let date: Date
    let image: UIImage?
}

struct PhotoFrameWidgetEntryView : View {
    var entry: PhotoProvider.Entry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        ZStack {
            if let image = entry.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
            } else {
                Color(.systemGray6)
                
                VStack(spacing: 8) {
                    Image(systemName: "photo")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    
                    Text("Open app to select photo")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
        }
    }
}

@main
struct PhotoFrameWidget: Widget {
    let kind: String = "PhotoFrameWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: PhotoProvider()) { entry in
            PhotoFrameWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Photo Frame")
        .description("Display your favorite photo on your Home Screen")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
