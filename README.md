**Dukaan Dost** — Simple inventory and ledger assistant for local shopkeepers.

## One-liner
**"Sales Badhao, Tension Ghatayo — Dukaan Dost."**
Help local shopkeepers increase sales and manage inventory through offline-first sync, analytics, and simple UI.

---

## 🚩 Problem Statement

Local shopkeepers often manage daily sales and purchases in notebooks. This leads to calculation mistakes, missing credit records, and difficulty tracking who owes money. They need an extremely simple mobile tool — not heavy POS systems.

**Target Beneficiaries:** Small kirana shops, street vendors, micro retailers.

## 💡 Solution Overview

Dukaan Dost allows shopkeepers to:

* Maintain **small inventory lists** (items & quantity).
* Record **sale and purchase entries**.
* Add customers by name and maintain **ledger / udhar records**.
* Work **fully offline** using **SQLite (Sqflite)**.
* Sync to **PHP + SQL backend (future scope)** when internet is available.

**Why it works:** No complex steps, low storage, extremely simple UI, local language labels.
Dukandost is a lightweight, offline-first mobile/web app that:

* Lets shopkeepers record sales and purchases offline.
* Automatically syncs local data to a central cloud database when internet is available.
* Provides simple analytics (best-sellers, low-stock alerts, daily sales summary).
* Supports multi-store accounts and local language (e.g., Hindi / Punjabi) UI.

**Key features**

* Offline-first data capture + conflict-resilient sync
* Inventory management & low-stock notifications
* Daily/weekly sales dashboard with CSV export
* Multilingual UI and simple onboarding

---

## 🏗️ Architecture & Tech Stack

**Mobile App:** Flutter

**Local Storage:** Sqflite (Offline-first)

**Future Cloud Sync:** PHP + MySQL (planned)

**Offline-first Flow:**

1. All entries stored in local SQLite.
2. Sync service checks network availability.
3. When online, entries upload to server.

## 🎯 How This Meets Y‑SoC Criteria

* **Real-world impact:** Helps small shopkeepers increase revenue and reduce stockouts.
* **Sustainability:** Offline-first reduces data costs; local language adoption.
* **Decentralization:** Local data store per device + optional federated sync for chains.
* **Inclusivity:** Simple UI, multilingual, low device requirements.
* **Scalability:** Modular backend and simple API allow scaling to regions.

---



## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repo
2. Create a feature branch: `feature/my-feature`
3. Open a PR with description + screenshots

Please follow the code style and add tests for new features.

---

## 📜 License

Choose an open-source license. Popular choices:

* MIT (permissive)
* Apache 2.0 (patent grant)
* GPLv3 (copyleft)

---

## 🔭 Future Scope (Nov 2025 – Apr 2026)

* Integrate digital payments & receipts.
* Add supply-chain features to reorder automatically.
* Local-language voice input for low-literacy users.
* Federated analytics for cooperative societies.

---

## 📇 Team

* Shivam Sangar — Flutter Developer (Full Stack Developer)
  Email: [rishavsangar10@gmail.com](mailto:rishavsangar10@gmail.com)
  Phone: +91 9878879398

---

## 🎯 Tagline

**"Sales Badhao, Tension Ghatayo — Dukaan Dost."**

---

## 🛠️ Developer Setup Instructions

1. Ensure **Flutter 3.35.6** is installed.
2. Open Command Prompt and navigate to your workspace directory (example:

```bash
cd D:flutter
```

3. Create a new Flutter project:

```bash
flutter create --org com.shivamdev hackathondukan
```

4. Open the created project in VSCode.
5. Copy these from this repository into your new project:

   * Folders: **Android**, **Assets**, **Lib**
   * File: **pubspec.yaml**
6. Then run these commands:

```bash
flutter clean
flutter pub get
flutter run
```

**Note:** Use a real device with Developer Options + USB Debugging on, or use an emulator.

---

## 🔗 GitHub Repository

[https://github.com/thatxshivamsangar/dukaandost](https://github.com/thatxshivamsangar/dukaandost)
