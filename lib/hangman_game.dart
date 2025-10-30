import 'package:flutter/material.dart';
import 'dart:math';

class HangmanGame extends StatefulWidget {
  @override
  _HangmanGameState createState() => _HangmanGameState();
}

class _HangmanGameState extends State<HangmanGame> {
  // List of words for the game - each play will have a different word
  final List<String> _words = [
    'FLUTTER',
    'DART',
    'MOBILE',
    'ANDROID',
    'PROGRAMMING',
    'COMPUTER',
    'KEYBOARD',
    'SCREEN',
    'DEVELOPER',
    'SOFTWARE',
    'HARDWARE',
    'INTERNET',
    'NETWORK',
    'DATABASE',

  ];

  List<String> _usedWords = []; // Track used words to ensure different words each play
  String _currentWord = '';
  Set<String> _guessedLetters = {};
  Set<String> _correctLetters = {};
  Set<String> _wrongLetters = {};
  int _wrongGuesses = 0;
  static const int _maxWrongGuesses = 6;
  bool _gameOver = false;
  bool _hasWon = false;
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _wordController = TextEditingController();
  bool _isLetterMode = true;
  Set<String> _guessedWords = {};

  @override
  void initState() {
    super.initState();
    _startNewGame();
  }

  void _startNewGame() {
    setState(() {
      // Select a random word that hasn't been used recently
      List<String> availableWords = _words.where((word) => !_usedWords.contains(word)).toList();
      
      // If all words have been used, reset the used words list
      if (availableWords.isEmpty) {
        _usedWords.clear();
        availableWords = _words;
      }
      
      final random = Random();
      _currentWord = availableWords[random.nextInt(availableWords.length)];
      _usedWords.add(_currentWord);
      
      // Keep only the last 50 used words to prevent the list from growing too large
      if (_usedWords.length > 50) {
        _usedWords = _usedWords.skip(_usedWords.length - 50).toList();
      }

      _guessedLetters.clear();
      _correctLetters.clear();
      _wrongLetters.clear();
      _wrongGuesses = 0;
      _gameOver = false;
      _hasWon = false;
      _textController.clear();
      _wordController.clear();
      _guessedWords.clear();
    });
  }

  void _makeGuess(String letter) {
    if (_gameOver || letter.isEmpty) return;

    letter = letter.toUpperCase();
    
    // Check if letter has already been guessed
    if (_guessedLetters.contains(letter)) {
      _showMessage('You already guessed "$letter"!');
      return;
    }

    setState(() {
      _guessedLetters.add(letter);
      
      if (_currentWord.contains(letter)) {
        // Correct guess
        _correctLetters.add(letter);
        
        // Check if player has won (all letters guessed)
        bool allLettersGuessed = _currentWord.split('').every((char) => _correctLetters.contains(char));
        if (allLettersGuessed) {
          _gameOver = true;
          _hasWon = true;
        }
      } else {
        // Wrong guess
        _wrongLetters.add(letter);
        _wrongGuesses++;
        
        // Check if player has lost (6 wrong guesses)
        if (_wrongGuesses >= _maxWrongGuesses) {
          _gameOver = true;
          _hasWon = false;
        }
      }
    });

    _textController.clear();
  }

  void _guessWord(String word) {
    if (_gameOver || word.isEmpty) return;

    word = word.toUpperCase().trim();
    
    if (word.length < 2) {
      _showMessage('Please enter a word with at least 2 letters!');
      return;
    }

    if (_guessedWords.contains(word)) {
      _showMessage('You already guessed "$word"!');
      return;
    }

    setState(() {
      _guessedWords.add(word);
      
      if (word == _currentWord) {
        // Correct word guess - player wins
        _gameOver = true;
        _hasWon = true;
        // Add all letters to correct letters for display
        for (String letter in _currentWord.split('')) {
          _correctLetters.add(letter);
        }
      } else {
        // Wrong word guess - counts as wrong guess
        _wrongGuesses++;
        
        if (_wrongGuesses >= _maxWrongGuesses) {
          _gameOver = true;
          _hasWon = false;
        }
      }
    });

    _wordController.clear();
  }

  void _selectLetter(String letter) {
    if (_gameOver) return;
    
    final key = _getKeyState(letter);
    if (key['disabled']) return;
    
    _makeGuess(letter);
  }

  Map<String, dynamic> _getKeyState(String letter) {
    bool isGuessed = _guessedLetters.contains(letter);
    bool isCorrect = _correctLetters.contains(letter);
    bool isWrong = _wrongLetters.contains(letter);
    
    return {
      'disabled': isGuessed,
      'correct': isCorrect,
      'wrong': isWrong,
    };
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _getDisplayWord() {
    return _currentWord.split('').map((char) {
      return _correctLetters.contains(char) ? char : '_';
    }).join(' ');
  }

  Widget _buildGuessedLettersDisplay() {
    if (_guessedLetters.isEmpty) {
      return Text(
        'No letters guessed yet',
        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_correctLetters.isNotEmpty) ...[
          Text(
            'Correct letters: ${_correctLetters.join(', ')}',
            style: TextStyle(fontSize: 16, color: Colors.green[700], fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
        ],
        if (_wrongLetters.isNotEmpty) ...[
          Text(
            'Wrong letters: ${_wrongLetters.join(', ')}',
            style: TextStyle(fontSize: 16, color: Colors.red[700], fontWeight: FontWeight.bold),
          ),
        ],
      ],
    );
  }

  Widget _buildModeToggle() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildToggleButton('🔤 Letters', _isLetterMode, () {
            setState(() {
              _isLetterMode = true;
            });
          }),
          SizedBox(width: 10),
          _buildToggleButton('💭 Word', !_isLetterMode, () {
            setState(() {
              _isLetterMode = false;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isActive, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.blue[700] : Colors.grey[300],
        foregroundColor: isActive ? Colors.white : Colors.grey[700],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVirtualKeyboard() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _buildKeyboardRow('QWERTYUIOP'),
          SizedBox(height: 8),
          _buildKeyboardRow('ASDFGHJKL'),
          SizedBox(height: 8),
          _buildKeyboardRow('ZXCVBNM'),
        ],
      ),
    );
  }

  Widget _buildKeyboardRow(String letters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: letters.split('').map((letter) {
        final keyState = _getKeyState(letter);
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: _buildKeyboardKey(letter, keyState),
        );
      }).toList(),
    );
  }

  Widget _buildKeyboardKey(String letter, Map<String, dynamic> keyState) {
    Color backgroundColor = Colors.grey[200]!;
    Color textColor = Colors.black;
    
    if (keyState['correct']) {
      backgroundColor = Colors.green[200]!;
      textColor = Colors.green[800]!;
    } else if (keyState['wrong']) {
      backgroundColor = Colors.red[200]!;
      textColor = Colors.red[800]!;
    } else if (keyState['disabled']) {
      backgroundColor = Colors.grey[400]!;
      textColor = Colors.grey[600]!;
    }

    return SizedBox(
      width: 35,
      height: 45,
      child: ElevatedButton(
        onPressed: keyState['disabled'] ? null : () => _selectLetter(letter),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: keyState['disabled'] ? 0 : 2,
        ),
        child: Text(
          letter,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildWordGuessSection() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            'Guess the whole word:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[800],
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _wordController,
                  decoration: InputDecoration(
                    hintText: 'Enter the word...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.characters,
                  onSubmitted: (value) => _guessWord(value),
                ),
              ),
              SizedBox(width: 15),
              ElevatedButton(
                onPressed: () => _guessWord(_wordController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Guess Word',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          if (_guessedWords.isNotEmpty) ...[
            SizedBox(height: 10),
            Text(
              'Guessed words: ${_guessedWords.join(', ')}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildGameOverDialog() {
    return AlertDialog(
      title: Text(
        _hasWon ? 'YOU WON!' : 'YOU LOST!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: _hasWon ? Colors.green : Colors.red,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _hasWon 
              ? 'Congratulations! You guessed the word!'
              : 'Game Over! The word was:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            _currentWord,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Would you like to play again?',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            _startNewGame();
          },
          child: Text(
            'Play Again',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Show game over dialog when game ends
    if (_gameOver) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => _buildGameOverDialog(),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hangman Game',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Wrong guesses counter
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.red[50],
                border: Border.all(color: Colors.red[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, color: Colors.red[700], size: 24),
                  SizedBox(width: 10),
                  Text(
                    'Wrong guesses: $_wrongGuesses / $_maxWrongGuesses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[700],
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),

            // Word display
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _getDisplayWord(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                  color: Colors.blue[800],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 30),

            // Guessed letters display
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Guessed Letters:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildGuessedLettersDisplay(),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Mode toggle and input sections
            if (!_gameOver) ...[
              _buildModeToggle(),
              
              if (_isLetterMode) ...[
                _buildVirtualKeyboard(),
              ] else ...[
                _buildWordGuessSection(),
              ],
              
              SizedBox(height: 20),
            ],

            Spacer(),

            // New game button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _startNewGame,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'New Game',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _wordController.dispose();
    super.dispose();
  }
}