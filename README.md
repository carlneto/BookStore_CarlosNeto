# 📚 BookFinder

## 1. Project Title

**BookFinder – Google Books Browser for iOS**

## 2. Short Description

BookFinder is an iOS application that fetches and displays book information from the Google Books API. It allows users to browse books, view detailed metadata, open external links, and mark items as favorites. The interface supports both master–detail navigation and automatic data loading as the user scrolls.

## 3. Requirements

* **iOS:** 13.0 or later
* **Xcode:** 15.0 or later
* **Swift:** 5.7 or later
* **Internet connection required** (Google Books API)

## 4. Installation

1. Clone or download the project folder.
2. Open the `.xcodeproj` file in **Xcode**.
3. Make sure all dependencies and assets are included.
4. Build and run using **⌘ + R** on a simulator or physical device.

## 5. Usage

### Main Features

* Scroll through a dynamically loaded list of books.
* Tap a book to view extended information.
* Mark or unmark a book as favorite.
* Toggle the **Favorites** switch to filter the list.
* Open the book’s info page in the browser.

### Example of API request

```swift
let urn = "https://www.googleapis.com/books/v1/volumes"
let uri = "\(urn)?q=ios&maxResults=\(maxResults)&startIndex=\(startIndex)"
```

### Opening external links

```swift
if let url = URL(string: link) {
    UIApplication.shared.open(url)
}
```

---

## 6. Project Structure

```
BookFinder/
├── Controllers/
│   ├── MasterViewController.swift       // Displays the list of books
│   └── DetailViewController.swift       // Shows book details, favorite handling, links
│
├── Models/
│   ├── BookVolumes.swift                // Root model for API response
│   ├── Item.swift                       // Individual book item
│   ├── VolumeInfo.swift                 // Metadata for each volume
│   ├── AccessInfo.swift                 // API access-related info
│   ├── SaleInfo.swift                   // Pricing & sale information
│   ├── ReadingModes.swift               // Text/image mode data
│   ├── ImageLinks.swift                 // Thumbnails
│   ├── IndustryIdentifiers.swift        // ISBN and similar codes
│   ├── PanelizationSummary.swift        // ePub/image bubble info
│   ├── ListPrice.swift                  // Price metadata
│   └── SearchInfo.swift                 // Text snippets
│
├── Views/
│   ├── BookTableViewCell.swift          // Cell UI for book list
│   └── Storyboards / XIBs               // Interface layouts
│
└── Resources/
    ├── Assets.xcassets                  // Icons, images
    └── LICENSE                          // Restricted Use License
```

**Summary:**

* **Controllers** manage UI logic and user interactions.
* **Models** represent the Google Books API response structure.
* **Views** define UI components.
* **Resources** contain images and legal documents.

---

## 7. Key Features

### 🔍 Book Search & Listing

* Fetches data from the Google Books API with pagination
* Auto-loads more books when the user reaches the end of the list

### ⭐ Favorite Management

* Favorites persist using `UserDefaults`
* UI buttons update across master–detail screens

### 📖 Detailed Book View

* Title, author, description, link to the full info page
* Automatic hiding of empty fields

### 🌗 Split View Support

* Fully compatible with iPad split view
* Master–detail architecture

### 📡 Asynchronous Networking

* Custom `asyncDownload` call
* JSON parsing with `Codable`

---

## 8. License (Summary)

This project is distributed under a **Restricted Use License**:

* **Modification, distribution, sharing, sublicensing, and commercial use are strictly prohibited** without prior written authorization from the Author.
* Only **personal, private, and non-commercial use for evaluation and testing** is permitted.
* The software is provided **as-is**, without warranties of any kind.
* The Author is not liable for any direct or indirect damages resulting from its use.
* Any violation immediately terminates all granted permissions.
* All rights remain exclusively with the Author.

For full details, refer to the `LICENSE` file.

---

## 9. Credits / Authors

**Author:** © 2025 — *carlneto*
Creator and maintainer of the BookFinder project and all related assets.
