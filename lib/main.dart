import 'package:flutter/material.dart';

void main() {
  runApp(AppEntry());
}

class AppEntry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadeTextWidget(),
    );
  }
}

class FadeTextWidget extends StatefulWidget {
  @override
  _FadeTextWidgetState createState() => _FadeTextWidgetState();
}

class _FadeTextWidgetState extends State<FadeTextWidget> {
  bool _visible = true;
  bool _showFrame = false;
  bool _isDarkMode = false;

  void _toggleFade() {
    setState(() {
      _visible = !_visible;
    });
  }

  void _toggleFrame(bool value) {
    setState(() {
      _showFrame = value;
    });
  }

  void _toggleMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fade Animation Example'),
          actions: [
            Switch(
              value: _showFrame,
              onChanged: _toggleFrame,
            ),
            IconButton(
              icon: Icon(_isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
              onPressed: _toggleMode,
            ),
          ],
        ),
        body: Center(
          child: Visibility(
            visible: _visible,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _toggleFade,
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: _showFrame
                          ? BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            )
                          : null,
                      child: const Text(
                        'Hello, Flutter!',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleFade,
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
