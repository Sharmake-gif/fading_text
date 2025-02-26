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

  void _toggleFade() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade Animation Example'),
      ),
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: const Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 38),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleFade,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
