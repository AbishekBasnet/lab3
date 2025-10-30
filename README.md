# This app is made with the help of copilot
#  Hangman Game Project

A modern, interactive Hangman word-guessing game built with multiple technologies and featuring virtual keyboards, dual game modes, and beautiful Material Design UI.

##  Live Demo

** Play Online Now**: https://abishekbasnet.github.io/lab3/game.html

*Experience the full game in your browser with no downloads required!*

##  Table of Contents

- [Live Demo](#-live-demo)
- [Features](#-features)
- [Project Structure](#-project-structure)
- [Technologies Used](#-technologies-used)
- [Installation & Setup](#-installation--setup)
- [How to Run](#-how-to-run)
- [GitHub Pages Deployment](#-github-pages-deployment)
- [Game Features](#-game-features)
- [Screenshots](#-screenshots)
- [Development](#-development)
- [Contributing](#-contributing)

##  Features

###  **Core Game Features**
- ** Programming Words**: Extensive vocabulary including Flutter, Dart, and programming terms
- **Dual Input Modes**: Switch between letter-by-letter and whole-word guessing
- **Smart Word Tracking**: Prevents recent word repetition for varied gameplay
- **Visual Progress Tracking**: Real-time display of correct/incorrect guesses
- **Win/Loss Detection**: Automatic game state management with celebration modals

### 🎹 **Interactive Elements**
- **Virtual QWERTY Keyboard**: Touch-friendly on-screen keyboard with visual feedback
- **Physical Keyboard Support**: Type letters directly on your keyboard
- **Color-Coded Feedback**: Green (correct), Red (wrong), Gray (used)
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices

###  **UI/UX Design**
- **Material Design**: Clean, modern interface following Google's design principles
- **Flutter-Style Theming**: Consistent blue/red/green color scheme
- **Smooth Animations**: Hover effects, button transitions, and modal animations
- **Accessibility**: High contrast colors and keyboard navigation support

##  Project Structure

```
hangman/
├── index.html                   # 🌐 GitHub Pages main file (PLAY HERE!)
├── lib/
│   ├── main.dart                 # Flutter app entry point
│   └── hangman_game.dart         # Main game logic and UI
├── web/
│   ├── index.html               # Flutter web configuration
│   └── manifest.json            # Web app manifest
├── android/                     # Android platform files
├── hangman_web.html            # Original web version
├── hangman_flutter_style.html  # Flutter-styled web version
├── 404.html                    # Custom 404 page for GitHub Pages
├── .nojekyll                   # GitHub Pages configuration
├── GITHUB_PAGES.md             # GitHub Pages deployment guide
├── pubspec.yaml                # Flutter dependencies
└── README.md                   # Project documentation
```

##  Technologies Used

### **Flutter/Dart**
- **Flutter SDK 3.26.0+**: Cross-platform mobile/web framework
- **Dart 3.5.3+**: Programming language for Flutter development
- **Material Design**: UI component library

### **Web Technologies**
- **HTML5**: Semantic markup and structure
- **CSS3**: Advanced styling with Grid, Flexbox, and animations
- **JavaScript ES6+**: Game logic and DOM manipulation
- **Responsive Design**: Mobile-first approach with media queries

### **Development Tools**
- **VS Code**: Primary development environment
- **Chrome DevTools**: Debugging and performance monitoring
- **Git**: Version control and project management

##  Installation & Setup

### **Prerequisites**
- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Chrome browser (for web development)
- Android Studio (for Android development)
- Git

### **Clone Repository**
```bash
git clone https://github.com/AbishekBasnet/hangman.git
cd hangman
```

### **Flutter Setup**
```bash
# Install Flutter dependencies
flutter pub get

# Verify Flutter installation
flutter doctor

# Enable web support (if not already enabled)
flutter config --enable-web
```

##  How to Run

### ** Option 1: Play Online (Recommended)**
**No installation required!**
Simply visit: **[https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)**

### **Option 2: Flutter Web (Local Development)**
```bash
# Add Flutter to PATH (Windows)
$env:PATH += ";C:\flutter\bin"

# Run on Chrome
flutter run -d chrome

# Or run on any available device
flutter run
```

### **Option 3: HTML Web Versions (Local)**
```bash
# Start local HTTP server
python -m http.server 8000

# Open in browser:
# Main GitHub Pages version: http://localhost:8000/
# Original: http://localhost:8000/hangman_web.html
# Flutter-style: http://localhost:8000/hangman_flutter_style.html
```

### **Option 4: Android (if configured)**
```bash
# List available devices
flutter devices

# Run on Android emulator
flutter run -d emulator-5554
```

##  GitHub Pages Deployment

This project is automatically deployed to GitHub Pages at: **[https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)**

### **How it Works**
1. **Main File**: `index.html` serves as the entry point
2. **Automatic Deployment**: Every push to `main` branch triggers deployment
3. **Custom 404**: Friendly error page for invalid URLs
4. **No Build Process**: Pure HTML/CSS/JS for instant deployment

### **Features for GitHub Pages**
-  **Instant Loading**: No framework dependencies
   **Mobile Optimized**: Responsive design for all devices
-  **Progressive Web App**: Installable on mobile devices
-  **SEO Optimized**: Meta tags and Open Graph support
-  **Game Statistics**: Local storage for progress tracking
-  **Offline Ready**: Cached resources for offline play

### **Deployment Configuration Files**
- **`.nojekyll`**: Disables Jekyll processing
- **`404.html`**: Custom error page
- **`GITHUB_PAGES.md`**: Deployment documentation

##  Game Features

### * Letter Mode**
- Click virtual keyboard keys to guess individual letters
- Visual feedback shows correct (green) and incorrect (red) guesses
- Physical keyboard support for desktop users
- Smart duplicate prevention

### ** Word Mode**
- Type complete words to guess instantly
- Successful word guess wins the game immediately
- Failed word guess counts as one wrong attempt
- History tracking of guessed words


