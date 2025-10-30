# 🎮 Hangman Game Project

A modern, interactive Hangman word-guessing game built with multiple technologies and featuring virtual keyboards, dual game modes, and beautiful Material Design UI.

## 🌟 Live Demo

**� Play Online Now**: [https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)

*Experience the full game in your browser with no downloads required!*

## �📋 Table of Contents

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

## ✨ Features

### 🎯 **Core Game Features**
- **250+ Programming Words**: Extensive vocabulary including Flutter, Dart, and programming terms
- **Dual Input Modes**: Switch between letter-by-letter and whole-word guessing
- **Smart Word Tracking**: Prevents recent word repetition for varied gameplay
- **Visual Progress Tracking**: Real-time display of correct/incorrect guesses
- **Win/Loss Detection**: Automatic game state management with celebration modals

### 🎹 **Interactive Elements**
- **Virtual QWERTY Keyboard**: Touch-friendly on-screen keyboard with visual feedback
- **Physical Keyboard Support**: Type letters directly on your keyboard
- **Color-Coded Feedback**: Green (correct), Red (wrong), Gray (used)
- **Responsive Design**: Optimized for desktop, tablet, and mobile devices

### 🎨 **UI/UX Design**
- **Material Design**: Clean, modern interface following Google's design principles
- **Flutter-Style Theming**: Consistent blue/red/green color scheme
- **Smooth Animations**: Hover effects, button transitions, and modal animations
- **Accessibility**: High contrast colors and keyboard navigation support

## 📁 Project Structure

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

## 🛠 Technologies Used

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

## 🚀 Installation & Setup

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

## 🎮 How to Run

### **🌐 Option 1: Play Online (Recommended)**
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

## 🌐 GitHub Pages Deployment

This project is automatically deployed to GitHub Pages at: **[https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)**

### **How it Works**
1. **Main File**: `index.html` serves as the entry point
2. **Automatic Deployment**: Every push to `main` branch triggers deployment
3. **Custom 404**: Friendly error page for invalid URLs
4. **No Build Process**: Pure HTML/CSS/JS for instant deployment

### **Features for GitHub Pages**
- ✅ **Instant Loading**: No framework dependencies
- ✅ **Mobile Optimized**: Responsive design for all devices
- ✅ **Progressive Web App**: Installable on mobile devices
- ✅ **SEO Optimized**: Meta tags and Open Graph support
- ✅ **Game Statistics**: Local storage for progress tracking
- ✅ **Offline Ready**: Cached resources for offline play

### **Deployment Configuration Files**
- **`.nojekyll`**: Disables Jekyll processing
- **`404.html`**: Custom error page
- **`GITHUB_PAGES.md`**: Deployment documentation

## 🎯 Game Features

### **🔤 Letter Mode**
- Click virtual keyboard keys to guess individual letters
- Visual feedback shows correct (green) and incorrect (red) guesses
- Physical keyboard support for desktop users
- Smart duplicate prevention

### **💭 Word Mode**
- Type complete words to guess instantly
- Successful word guess wins the game immediately
- Failed word guess counts as one wrong attempt
- History tracking of guessed words

### **📊 Game Mechanics**
- **6 Wrong Guesses Maximum**: Traditional hangman rules
- **Programming Vocabulary**: 250+ tech-related words
- **Smart Word Selection**: Avoids recently used words
- **Multiple Win Conditions**: Complete letter revelation or correct word guess

### **🏆 Scoring System**
- Instant win for correct word guesses
- Progressive revelation for letter guessing
- Wrong guess penalty system
- Game over at 6 mistakes

## 📱 Screenshots

### Flutter App
![Flutter Hangman Game](screenshots/flutter-app.png)

### Web Version
![Web Hangman Game](screenshots/web-version.png)

### Mobile Responsive
![Mobile Hangman Game](screenshots/mobile-responsive.png)

## 🔧 Development

### **Project Architecture**

#### **Flutter App (`lib/`)**
- **`main.dart`**: App initialization and Material theme setup
- **`hangman_game.dart`**: Core game logic, UI components, and state management

#### **Web Versions**
- **`hangman_web.html`**: Original web implementation
- **`hangman_flutter_style.html`**: Flutter-styled web version

### **Key Components**

#### **Game State Management**
```dart
// Core game variables
String currentWord = '';
Set<String> guessedLetters = {};
Set<String> correctLetters = {};
Set<String> wrongLetters = {};
int wrongGuesses = 0;
bool gameOver = false;
```

#### **Virtual Keyboard**
```dart
Widget _buildVirtualKeyboard() {
  return Container(
    child: Column(
      children: [
        _buildKeyboardRow('QWERTYUIOP'),
        _buildKeyboardRow('ASDFGHJKL'),
        _buildKeyboardRow('ZXCVBNM'),
      ],
    ),
  );
}
```

### **Customization**

#### **Add New Words**
```dart
final List<String> _words = [
  'FLUTTER',
  'DART',
  'YOUR_NEW_WORD',
  // Add more words here
];
```

#### **Modify Difficulty**
```dart
static const int _maxWrongGuesses = 6; // Change difficulty
```

#### **Styling**
- Edit colors in CSS variables for web versions
- Modify `Colors` constants in Flutter version

## 🤝 Contributing

### **How to Contribute**
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### **Contribution Guidelines**
- Follow Flutter/Dart style guidelines
- Add comments for complex logic
- Test on multiple devices/browsers
- Update README for new features

### **Bug Reports**
Please include:
- Device/browser information
- Steps to reproduce
- Expected vs actual behavior
- Screenshots if applicable

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Flutter Team**: For the amazing cross-platform framework
- **Material Design**: For the beautiful UI guidelines
- **Programming Community**: For word suggestions and feedback

## 📞 Contact

- **Developer**: AbishekBasnet
- **Email**: abishekbasnet28@gmail.com
- **GitHub**: [@AbishekBasnet](https://github.com/AbishekBasnet)
- **Project Link**: [https://github.com/AbishekBasnet/hangman](https://github.com/AbishekBasnet/hangman)
- **Live Demo**: [https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)

---

### 🎮 **Ready to Play?**

**🌐 Play Online Now**: [https://abishekbasnet.github.io/hangman/](https://abishekbasnet.github.io/hangman/)

Choose your preferred version and start guessing! Whether you prefer the Flutter app experience or the web version, you'll enjoy the same great gameplay with beautiful Material Design UI.

**Happy Coding! 🚀**
