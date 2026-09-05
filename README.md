# 🔍 Pokédex 

A Flutter mobile app that lets users search for any Pokémon by name and view its image, types, height, and weight — built using the PokeAPI.

## ✨ Features

- 🔍 Search any Pokémon by name
- 🖼️ Displays official artwork image
- 🏷️ Color-coded type badges (Fire, Water, Electric, etc.)
- 📊 Height, weight
- ⏳ Loading state while fetching data
- ❌ Graceful error handling with a custom illustration for invalid searches
- 🔔 Snackbar notification on failed searches

## 🛠️ Tech Stack

- **Flutter** & **Dart**
- **PokeAPI** — [https://pokeapi.co](https://pokeapi.co)
- **http** package for API calls
- **provider** package for state management
- **flutter_svg** for custom illustrations

## 🏗️ Architecture

This app follows the **MVVM (Model-View-ViewModel)** pattern:

- 📦 **Model** — defines the shape of Pokémon data
- 🌐 **Repository** — handles the actual HTTP request to PokeAPI
- 🧠 **ViewModel** — manages app state and connects Repository to UI
- 📱 **View** — the search screen
- 🧩 **Widgets** — Loading indicator, error illustration, and result card

## ⚙️ How it works

1. User types a Pokémon name and taps Search
2. App calls `GET https://pokeapi.co/api/v2/pokemon/{name}`
3. Response is parsed into a `Pokemon` object
4. UI updates to show the result — or a friendly error message if not found

## 📋 Prerequisites

Before running the project, make sure you have:

1. [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
2. A code editor (VS Code / Android Studio)
3. An emulator or a real device (Android / iOS)

To check if Flutter is properly installed:

```bash
flutter doctor
```

## 🚀 How to Run

1. Clone the repository:

```bash
git clone https://github.com/Shivangi1224/pokedex_app.git
```

2. Navigate to the project folder:

```bash
cd pokedex_app
```

3. Get the dependencies:

```bash
flutter pub get
```

4. Run the app:

```bash
flutter run
```

## 🎥 Demo

[▶️ Watch Demo Video Here](https://drive.google.com/file/d/1WU_wlRFzUrqcgoAfOeTF9BTs4HgRUV7m/view?usp=sharing)

---
<div align="center">
  
_Thanks for checking out Pokédex ! ✨_

</div>
